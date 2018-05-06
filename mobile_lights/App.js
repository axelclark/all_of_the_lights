import React from 'react';
import ServerForm from './components/ServerForm'
import Controls from './components/Controls'

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputValue: '',
      serverAddress: null
    };
  }

  inputChange(inputValue) {
    this.setState({ inputValue })
  }

  setServerAddress() {
    const serverAddress = this.state.inputValue
    this.setState({ serverAddress })
  }

  setDefaultAddress() {
    const serverAddress = "ws://192.168.0.199/socket"
    this.setState({ serverAddress })
  }

  render() {
    const { inputValue, serverAddress } = this.state

    if (serverAddress) {
      return (
        <Controls serverAddress={serverAddress} />
      );
    } else {
      return (
        <ServerForm
          inputValue={inputValue}
          inputChange={(text) => this.inputChange(text)}
          setServerAddress={() => this.setServerAddress()}
          setDefaultAddress={() => this.setDefaultAddress()}
        />
      );
    }
  }
}

export default App
