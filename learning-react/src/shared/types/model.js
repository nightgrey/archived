/* @flow */
/* eslint-disable import/prefer-default-export */

export type Post = {
  id: number,
  title: string,
  body: string,
};

export type User = {
  id: number,
  username: string,
  steamId: number,
  games: mixed,
}