import React from 'react';
import { StyleSheet, View } from 'react-native';
import { FormLabel, FormInput, Button } from 'react-native-elements'
import { Socket } from 'phoenix';

const ControlButton = ({ handlePress, title }) => (
  <Button
    onPress={handlePress}
    title={title}
    backgroundColor='blue'
    containerViewStyle={{ margin: 20 }}
    fontSize='36'
  />
)

class Controls extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      channel: null
    };
  }

  componentDidMount() {
    const socket = new Socket(this.props.serverAddress, {});
    socket.connect();

    const channel = socket.channel("switch:bedroom", {})
    channel.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })

    this.setState({ channel })
  }

  handlePress(action) {
    console.log('push', action)
    this.state.channel.push(action, {body: action})
  }

  render() {
    return (
      <View style={styles.container}>
        <ControlButton
          handlePress={() => this.handlePress("on")}
          title='On'
        />
        <ControlButton
          handlePress={() => this.handlePress("off")}
          title='Off'
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20
  }
});

export default Controls
