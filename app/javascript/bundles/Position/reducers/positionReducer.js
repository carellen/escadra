import { combineReducers } from 'redux';
import {POSITION_SET_TITLE, POSITION_UPDATE} from '../constants/positionConstants';
import { POSITION_NEW } from '../constants/positionConstants';

const position = (state = {}, action) => {
  switch (action.type) {
    case POSITION_NEW:
      return {
        id: action.id,
        title: action.title,
        position_attributes: action.position_attributes,
        company: action.company
      };
    case POSITION_SET_TITLE:
      return {...state, title: action.title};
    default:
      return state;
  }
};

const railsContext = (state = {}, action) => {
  switch (action.type) {
    default:
      return state;
  }
};

const positionReducer = combineReducers({
  position,
  railsContext
});

export default positionReducer;
