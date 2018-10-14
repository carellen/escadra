import React from 'react';
import { Provider } from 'react-redux';
import ReactOnRails from 'react-on-rails';
import { AppContainer } from "react-hot-loader";
import { render } from "react-dom";

import NewPositionContainer from '../containers/NewPositionContainer';

const NewPosition = (railsProps, railsContext, domNodeId) => {
  const store = ReactOnRails.getStore('positionStore');

  const renderApp = (Komponent) => {
    const element = (
      <AppContainer>
        <Provider store={store}>
          <Komponent />
        </Provider>
      </AppContainer>
    );
    render(element, document.getElementById(domNodeId));
  };

  renderApp(NewPositionContainer);

  if (module.hot) {
    module.hot.accept(['../containers/NewPositionContainer'], () => {
      renderApp(NewPositionContainer);
    })
  }
};

export default NewPosition;
