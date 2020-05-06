import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
// import logger from 'redux-logger'
import ReduxPromise from 'redux-promise';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import App from './components/app';
import messagesReducer from './reducers/messages_reducer';

const chatContainer = document.getElementById('chat_app');
const channels = JSON.parse(chatContainer.dataset.channels).map(c => c.name);
const users = JSON.parse(chatContainer.dataset.users).map(u => u.nickname ? u.nickname : u.email);

const initialState = {
  messages: [],
  channels: channels,
  users: users // TODO: get that from Rails DB.
};

const reducers = combineReducers({
  messages: messagesReducer,
  channels: (state = null, action) => state,
  users: (state = null, action) => state
});

const middlewares = applyMiddleware(ReduxPromise);
const store = createStore(reducers, initialState, middlewares);

ReactDOM.render(
  <Provider store={store}>
    <BrowserRouter>
      <Switch>
        <Route path="/channels/:channel" component={App} />
      </Switch>
    </BrowserRouter>
  </Provider>,
  chatContainer
);
