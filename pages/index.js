import React, { useState } from 'react';
import Router from 'next/router'
import Layout from '../components/layout';

export default () => {
  const [roomId, setRoomId] = useState();

  const handleChange = (event) => {
    setRoomId(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();

    if (roomId) {
      Router.push(`/room/${roomId}`);
    }
  };

  return (
    <Layout>
      <div className="flex items-center justify-center h-screen">
        <div className="container text-center">
          <h1 className="text-5xl text-gray-800 uppercase pb-6 font-bold">Scrum. Poker</h1>
          <form onSubmit={handleSubmit} className="max-w-2xl mx-auto mb-8">
            <input onChange={handleChange} placeholder="Room ID" className="text-2xl text-gray-600 bg-white text-center shadow-lg rounded p-3 w-full " type="text" />
          </form>
          <div className="max-w-2xl mx-auto text-left">
            Alternatively, you can
            {' '}
            <a className="text-gray-600 font-bold">create a room.</a>
          </div>
        </div>
      </div>
    </Layout>
  );
};
