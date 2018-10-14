import { compose, createStore, applyMiddleware } from 'redux';
import thunkMiddleware from 'redux-thunk';

import reducers from '../reducers/positionReducer';

const positionStore = (railsProps, railsContext) => {

  const initialState = {
    ...railsProps,
    railsContext,
  };

  const composedStore = compose(
    applyMiddleware(thunkMiddleware),
  );

  return composedStore(createStore)(reducers, initialState);
};

export default positionStore;
