import { Router } from 'express';
import * as exampleController from '../controllers/user';
import * as authController from "../controllers/auth"
import { authenticateUser } from "../midllewares/authMiddleware";

const router = Router();

router.post('/signUp', authController.register)

router.use(authenticateUser);

router.get('/example',  exampleController.getExample);
router.post('/signIn', authController.login)

export default router;
