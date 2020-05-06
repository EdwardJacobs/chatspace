/* eslint no-bitwise:off */
import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { selectChannel, fetchMessages } from '../actions/index';

class ChannelList extends Component {

  handleClick = (channel) => {
    this.props.selectChannel(channel);
    this.props.fetchMessages(channel);
  }

  renderChannel = (channel) => {
    return (
      <li
        key={channel}
        className={channel === this.props.selectedChannel ? 'active' : null}
        onClick={() => this.handleClick(channel)}
      >
        <Link
          to={`/channels/${channel}`}>
          # {channel}
        </Link>
      </li>
    );
  }

  renderUser = (user) => {
    return (
      <li key={user}>
        <a>{user}</a>
      </li>
    )
  }

  render() {
    return (
      <div className="channels-container">
        <ul>
        <span>Channels</span>
          {this.props.channels.map(this.renderChannel)}
        </ul>
        <ul>
        <span>Members</span>
          {this.props.users.map(this.renderUser)}
        </ul>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    channels: state.channels,
    users: state.users
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ selectChannel, fetchMessages }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ChannelList);
