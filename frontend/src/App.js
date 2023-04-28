import './App.css';

import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider
} from "@apollo/client";

import { Sample } from './Sample';


const client = new ApolloClient({
  uri: 'http://localhost:3010/graphql',
  cache: new InMemoryCache()
});

function App() {
  return (
    <ApolloProvider client={client} >
      <Sample />
    </ApolloProvider>
  );
}

// NOTE: 初回のコード
//function App() {
//  return (
//    <div className="App">
//      <header className="App-header">
//        <img src={logo} className="App-logo" alt="logo" />
//        <p>
//          Edit <code>src/App.js</code> and save to reload.
//        </p>
//        <a
//          className="App-link"
//          href="https://reactjs.org"
//          target="_blank"
//          rel="noopener noreferrer"
//        >
//          Learn React
//        </a>
//      </header>
//    </div>
//  );
//}

export default App;
