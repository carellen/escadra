/* eslint-disable import/prefer-default-export */

import { POSITION_NEW } from '../constants/positionConstants';
import { POSITION_SET_TITLE } from '../constants/positionConstants';
import { ADD_MEMBER } from '../constants/positionConstants';
import ReactOnRails from 'react-on-rails'

export const updatePosition = (params) => ({
  type: POSITION_UPDATE,
  params,
});

export const setPositionTitle = (title) => ({
  type: POSITION_SET_TITLE,
  title,
});

export const createPosition = (params) => {
  console.log(params);
  return({
  type: POSITION_NEW,
  position: fetch(`/companies/${params.company_id}/positions`, {
    method: 'POST',
    body: JSON.stringify(params),
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': ReactOnRails.authenticityToken(),
    },
    credentials: 'same-origin'
  })
})};

