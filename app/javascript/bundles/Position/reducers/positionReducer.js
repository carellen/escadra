import { combineReducers } from 'redux';
import { reducer as form } from 'redux-form';
import {POSITION_SET_TITLE, POSITION_UPDATE, ADD_MEMBER} from '../constants/positionConstants';
import { POSITION_NEW } from '../constants/positionConstants';

const position = (state = {}, action) => {
  switch (action.type) {
    case POSITION_NEW:
      return {
        id: action.id,
        title: action.title,
        position_attributes: action.position_attributes,
        company_id: action.company_id
      };
    case POSITION_SET_TITLE:
      return {...state, title: action.title};
    case ADD_MEMBER:
      console.log('Adding member...');
      return action.payload;
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
  form,
  railsContext
});

export default positionReducer;
