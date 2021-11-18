import React, { Component } from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Task from './Page/Task'
import NotFound from './Page/NotFound'
import Activity from './Page/Activity';
import 'bootstrap/dist/css/bootstrap.min.css';
import './custom.css';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Task />} />
        <Route path='/activity' element={<Activity />} />
        <Route path='/calendar' element={<Activity />} />
        <Route path='/files' element={<Activity />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
