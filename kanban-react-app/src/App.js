import React, { Component } from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Task from './Page/Task'
import Activity from './Page/Activity';
import Calendar from './Page/Calendar';
import Files from './Page/Files';
import 'bootstrap/dist/css/bootstrap.min.css';
import './custom.css';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Task />} />
        <Route path='/activity' element={<Activity />} />
        <Route path='/calendar' element={<Calendar />} />
        <Route path='/files' element={<Files />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
