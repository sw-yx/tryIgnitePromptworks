import '../Config'
import DebugConfig from '../Config/DebugConfig'
import React, { Component } from 'react'
import { Provider } from 'react-redux'
import RootContainer from './RootContainer'
import createStore from '../Redux'
import ActionExtensionScreen from './ActionExtensionScreen'

// create our store
const store = createStore()

/**
 * Provides an entry point into our application.  Both index.ios.js and index.android.js
 * call this component first.
 *
 * We create our Redux store here, put it into a provider and then bring in our
 * RootContainer.
 *
 * We separate like this to play nice with React Native's hot reloading.
 */
class App extends Component {
  // static propTypes = {
  //   isActionExtension: React.PropTypes.bool,
  //   key2: React.PropTypes.object,
  // }

  // static defaultProps = {
  //   isActionExtension: false,
  //   key2: {msg: 'not extension'}
  // }

  render () {
    const component = this.props.isActionExtension ? <ActionExtensionScreen key2={this.props.key2} /> : <RootContainer />
    console.log('this.props', this.props)
    return (
      <Provider store={store}>
        { component }
      </Provider>
    )
  }
}

// allow reactotron overlay for fast design in dev mode
export default DebugConfig.useReactotron
  ? console.tron.overlay(App)
  : App
