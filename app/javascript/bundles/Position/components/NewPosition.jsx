import PropTypes from 'prop-types';
import React from 'react';

const NewPosition = ({ position, createPosition, setPositionTitle }) => (
  <div>
    <form onSubmit={(e) => createPosition(e.target.value)}>
      <label htmlFor="positionTitle">
        Position title:
      </label>
      <input
        id="positionTitle"
        type="text"
        value={position.title}
        onChange={(e) => setPositionTitle(e.target.value)}
      />
    </form>
  </div>
);

NewPosition.propTypes = {
    createPosition: PropTypes.func.isRequired,
  setPositionTitle: PropTypes.func.isRequired,
};

export default NewPosition;
