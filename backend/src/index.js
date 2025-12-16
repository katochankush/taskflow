const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ 
    status: 'healthy',
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || 'development'
  });
});

// API endpoints
app.get('/api/tasks', (req, res) => {
  res.json([
    { id: 1, title: 'Learn Docker', completed: false },
    { id: 2, title: 'Learn Kubernetes', completed: false },
    { id: 3, title: 'Deploy to AWS', completed: false }
  ]);
});

app.post('/api/tasks', (req, res) => {
  const { title } = req.body;
  res.status(201).json({
    id: Math.random(),
    title,
    completed: false,
    createdAt: new Date().toISOString()
  });
});

// Error handling
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!' });
});

// Start server
app.listen(PORT, () => {
  console.log('Backend server running on port ' + PORT);
  console.log('Health check: http://localhost:' + PORT + '/health');
  console.log('Tasks endpoint: http://localhost:' + PORT + '/api/tasks');
});

module.exports = app;
