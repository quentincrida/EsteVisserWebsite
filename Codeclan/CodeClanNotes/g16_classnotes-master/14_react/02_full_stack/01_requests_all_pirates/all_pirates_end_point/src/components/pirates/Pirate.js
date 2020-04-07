import React, {Fragment} from 'react';

const Pirate = (props) => {

  if (!props.pirate){
    return "Loading..."
  }
  return (
    <Fragment>
    <p>
    {props.pirate.firstName} {props.pirate.lastName}
    </p>
    <p>Age: {props.pirate.age}</p>
    <p>Ship: {props.pirate.ship.name}</p>
    </Fragment>
  )
}

export default Pirate;
