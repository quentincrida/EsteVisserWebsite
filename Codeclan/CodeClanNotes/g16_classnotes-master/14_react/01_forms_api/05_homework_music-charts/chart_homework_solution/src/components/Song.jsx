import React, {Component} from 'react';

const Song = (props) => {
    let audioContainer;

    const altTag = `${props.song['im:name'].label} by ${props.song['im:artist'].label}`;

    return (
      <div className="song">
        <img
          alt={"Play " + altTag}
          id={props.position}
          className='audio-control'
          src='https://image.freepik.com/free-icon/play-button_318-42541.jpg'
          onClick={() => {props.handlePlayPause(audioContainer)}}
        />

        <img
          src={props.song['im:image'][1].label}
          alt={altTag} />

        <div className='details'>
          <h3>{props.position}. {props.song['im:name'].label}</h3>
          <h4>{props.song['im:artist'].label}</h4>
        </div>

        <audio
          ref={(audio) => audioContainer = audio}
          id={'audio' + props.position}
          src={props.song.link[1].attributes.href} />
      </div>
    );
  }
;

export default Song;
