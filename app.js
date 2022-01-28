const express = require('express');
const exphbs = require('express-handlebars');
const mongoose = require('mongoose');
const session = require('express-session');
const methodOverride = require('method-override');
const flash = require('connect-flash');
const ExpressError = require('./utils/ExpressError');
const { isLoggedIn } = require('./middleware');

const passport = require('passport');
const LocalStrategy = require('passport-local');
const User = require('./models/user');
const catchAsync = require('./utils/catchAsync');
const Complaint = require('./models/complaint');

const userRoutes = require('./server/routes/users');

require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

//Static Files
app.use(express.static('public'));
app.use(methodOverride('_method'));

const handlebars = exphbs.create({ extname: '.hbs', });
app.engine('.hbs', handlebars.engine);
app.set('view engine', '.hbs');



const dbUrl = process.env.DB_URL || 'mongodb://localhost:27017/mobile_management';
mongoose.connect(dbUrl, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error:"));
db.once("open", () => {
    console.log("Mongo Database connected");
});

const sessionConfig = {
    secret: 'thisshouldbeasecret',
    resave: false,
    saveUninitialized: true,
    cookie: {
        httpOnly: true,
        // secure: true,
        expires: Date.now() + 1000 * 60 * 60 * 24 * 7,
        maxAge: 1000 * 60 * 60 * 24 * 7
    }
}

app.use(session(sessionConfig));
app.use(flash());

app.use(passport.initialize());
app.use(passport.session());
passport.use(new LocalStrategy(User.authenticate()));

passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());

app.use((req, res, next) => {
    res.locals.currentUser = req.user;
    res.locals.user = null;
    if (req.isAuthenticated()) {
        res.locals.user = req.user.username;
    }
    res.locals.success = req.flash('success');
    res.locals.error = req.flash('error');
    next();
})

const comp_routes = require('./server/routes/company');
app.use('/company', comp_routes);

const mobile_routes = require('./server/routes/mobile');
app.use('/mobile', mobile_routes);

const orders_routes = require('./server/routes/orders');
app.use('/orders', orders_routes);

const cust_routes = require('./server/routes/customer');
app.use('/customer', cust_routes);

const trig_routes = require('./server/routes/trig');
app.use('/logs', trig_routes);

const store_routes = require('./server/routes/store');
app.use('/store', store_routes);



app.use('/', userRoutes);


app.get('/', (req, res) => {
    res.render('home', { layout: false, })
});

app.post('/mobile/viewmobile/:Mob_ID/complaints', catchAsync(async (req, res) => {
    const complaint = new Complaint({ mob_id: req.params.Mob_ID, cust_id: req.body.cust_id, body: req.body.body, rating: req.body.rating });
    await complaint.save();
    res.redirect(`/mobile/viewmobile/${req.params.Mob_ID}`);
}))

app.delete('/mobile/viewmobile/:Mob_ID/complaints/:complaintId', catchAsync(async (req, res) => {
    const { Mob_ID, complaintId } = req.params;
    await Complaint.findByIdAndDelete(complaintId);
    res.redirect(`/mobile/viewmobile/${Mob_ID}`);
}))

/* app.all('*', (req, res, next) => {
    next(new ExpressError('Page Not Found', 404))
})
app.use((err, req, res, next) => {
    const { statusCode = 500 } = err;
    if (!err.message) err.message = 'Oh No, Something Went Wrong!'
    res.status(statusCode).render('error', { err })
}) */

app.listen(port, () => console.log(`Listening on port ${port}`));