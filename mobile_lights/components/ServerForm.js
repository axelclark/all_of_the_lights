import React from 'react';
import { StyleSheet, View } from 'react-native';
import { FormLabel, FormInput, Button } from 'react-native-elements'

const ServerForm = ({
  inputValue,
  inputChange,
  setServerAddress,
  setDefaultAddress
}) => (
  <View style={styles.container}>
    <FormLabel>Server Address</FormLabel>
    <FormInput
      value={inputValue}
      placeholder='Please enter your server socket address.'
      placeholderTextColor='#CACACA'
      onChangeText={inputChange}
    />
    <Button
      title='Submit'
      onPress={setServerAddress}
    />
    <Button
      title='Set Default'
      onPress={setDefaultAddress}
      containerViewStyle={{ marginTop: 40 }}
      color='blue'
      backgroundColor='white'
    />
  </View>
)


const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20
  },
});

export default ServerForm
