import { Router } from 'express';

const router = Router();

// Define your API routes here
router.get('/example', (req, res) => {
    res.send('This is an example route');
});

// Export the router
export default (app: any) => {
    app.use('/api', router);
};