import express from 'express';
import exampleRoutes from './routes/userRoute';

const app = express();
app.use(express.json());

app.use('/api', exampleRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`API Service running on port ${PORT}`);
});
