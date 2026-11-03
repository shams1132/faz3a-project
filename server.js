const express = require('express');
 const cors = require('cors');
  require('dotenv').config();
  const app = express();
 app.use(cors());
  app.use(express.json()); 
  app.use('/api/auth', require('./routes/authRoutes'));
  const authMiddleware = require('./middleware/authMiddleware');
app.use('/api/donors', authMiddleware, require('./routes/donorRoutes'));
app.use('/api/emergency', require('./routes/emergencyRoutes')); 
 app.get('/', (req, res) => {
   res.send(' Faz3a Secure API Server Running');
   });        
   const PORT = process.env.PORT || 5000;
    app.listen(PORT, () => {
       console.log(" Server running on port " + PORT);
       });