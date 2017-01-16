/* @flow */
/* eslint-disable import/prefer-default-export */

import type { User } from '../types/model';
import type { Action, ThunkAction } from '../types/redux';

function getSteamId(username: string) : Action {
  return {
    type: 'GET_STEAM_ID',
    payload: username
  }
}

function fetching(id: number) : Action {
  return { type: 'FETCHING_POST', payload: id };
}

function fetched(user: User) : Action {
  return { type: 'FETCHED_POST', payload: post };
}

export function fetch(id: number) : ThunkAction {
  return (dispatch, getState, { axios }) => {
    dispatch(fetching(id));

    return axios
      .get(`https://jsonplaceholder.typicode.com/posts/${id}`)
      .then(({ data }) => dispatch(fetched(data)))
      // We use 'react-jobs' to call our actions.  We don't want to return
      // the actual action to the 'react-jobs' withJob as it will cause
      // the data to be serialized into the react-jobs state by the server.
      // As we already have the state in the redux state tree, which is also
      // getting serialized by the server we will just return a simple "true"
      // here to indicate to react-jobs that all is well.
      .then(() => true);
  };
}
