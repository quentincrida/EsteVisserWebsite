import React from 'react';
import Song from './Song';

const Chart = (props) => {
  if (props.songs == null || props.songs.length === 0) {
    return <p>Loading...</p>;
  }
  return (
    <div>
      {props.songs.map((song, index) => {
      return (
        <Song
          key={index}
          position={index + 1}
          song={song}
          handlePlayPause={props.handlePlayPause}
        />
      )
    })}
    </div>
  );
};

export default Chart;
