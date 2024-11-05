import { Router } from 'express';
import * as exampleController from '../controllers/user';

const router = Router();

router.get('/example', exampleController.getExample);

export default router;
