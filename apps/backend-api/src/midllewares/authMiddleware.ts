import { Request, Response, NextFunction } from 'express';
import jwt from "jsonwebtoken";

export const authenticateUser = (req: Request, res: Response, next: NextFunction) => {
    const token = req.header('Authorization')?.replace('Bearer ', '');

    if (!token) {
        return res.status(401).json({ error: "Access denied" });
    }

    try {
        const verified = jwt.verify(token, process.env.JWT_SECRET as string);
        (req as any).user = verified;
        next();
    } catch (err) {
        return res.status(400).json({ error: "Invalid token" });
    }
};
