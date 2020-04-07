import React, {Component}  from 'react';
import Pirate from "./Pirate";
import {Link} from 'react-router-dom';

class PirateDetail extends Component {

  constructor(props){
    super(props)
    this.handleDelete = this.handleDelete.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleDelete(){
    this.props.onDelete(this.props.pirate.id)
  }

  deleteRaid(raidIndex) {
    this.props.pirate.raids.splice(raidIndex, 1)
    this.props.onUpdate(this.props.pirate)
  }

  pirateHasRaid(raid){
    return this.props.pirate.raids.some((pirateRaid) => {
      return raid.id === pirateRaid.id
    })
  }

  handleSubmit(event){
      event.preventDefault();
      const index = parseInt(event.target.raids.value)
      const raid = this.props.raids[index];
      this.props.pirate.raids.push(raid)
      this.props.onUpdate(this.props.pirate);
    }

  render(){
    if (!this.props.pirate){
      return "Loading..."
    }

    const raids = this.props.pirate.raids.map((raid, index) => {
      return <li key={index}>
      {raid.location} <button onClick={() => this.deleteRaid(index)}>Delete</button>
      </li>
    })

    const editUrl = "/pirates/" + this.props.pirate.id + "/edit"

    const raidOptions = this.props.raids.map((raid, index) => {
      if (!this.pirateHasRaid(raid)){
        return (
          <option key={index} value={index}>{raid.location}</option>
        )
      } else {
        return null
      }
    })

    return (
      <div className = "component">
      <Pirate pirate = {this.props.pirate}/>
      <p>Raids:</p>
      <ul>
      {raids}
      </ul>
      <form onSubmit={this.handleSubmit}>
      <select name="raids" >
      {raidOptions}
      </select>
      <input type="submit" value="Add Raid"/>
      </form>
      <button onClick={this.deletePirate}>Delete {this.props.pirate.firstName}</button>
      <Link to= {editUrl}><button type="button">Edit {this.props.pirate.firstName}</button></Link>
      </div>
    )
  }
}

export default PirateDetail;
