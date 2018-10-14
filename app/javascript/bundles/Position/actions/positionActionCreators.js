/* eslint-disable import/prefer-default-export */

import { POSITION_UPDATE } from '../constants/positionConstants';
import { POSITION_SET_TITLE } from '../constants/positionConstants';

export const updatePosition = (params) => ({
  type: POSITION_UPDATE,
  params,
});

export const setPositionTitle = (title) => ({
  type: POSITION_SET_TITLE,
  title,
});

export const createPosition = (params) => ({
  type: POSITION_UPDATE,
  id: params.id,
  title: params.title,
  position_attributes: params.position_attributes,
  company: params.company
});
