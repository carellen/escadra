import PropTypes from 'prop-types';
import React from 'react';
import FieldArraysForm from "../containers/FieldArraysForm";
import { Values } from "redux-form-website-template";

const NewPosition = ({ position, createPosition }) => {
  const handleSubmit = (values) => {
    createPosition({ ...values, company_id: position.company_id })
  };
  return(
    <div>
      <FieldArraysForm onSubmit={handleSubmit}/>
    </div>
  );
};

NewPosition.propTypes = {
    createPosition: PropTypes.func.isRequired,
  setPositionTitle: PropTypes.func.isRequired,
};

export default NewPosition;
