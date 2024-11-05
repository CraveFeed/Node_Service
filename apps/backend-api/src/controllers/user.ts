import { Request, Response } from 'express';

export const getExample = async (req: Request, res: Response): Promise<void> => {
    try {
        res.status(200).json({ message: 'Hello from the backend API!' });
    } catch (e ) {
        res.status(500).json({ message: 'Internal server error' });
    }
};
