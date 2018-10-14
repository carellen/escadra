import PropTypes from 'prop-types';
import React from 'react';

const UpdatePosition = ({ title, updatePosition }) => (
    <div>
        <h3>
            UPDATE POSITION
        </h3>
        <hr />
        <form >
            <label htmlFor="positionTitle">
                Position title:
            </label>
            <input
                id="positionTitle"
                type="text"
                value={title}
                onChange={(e) => updatePosition(e.target.value)}
            />
        </form>
    </div>
);

UpdatePosition.propTypes = {
    title: PropTypes.string.isRequired,
    updatePosition: PropTypes.func.isRequired,
};

export default UpdatePosition;
