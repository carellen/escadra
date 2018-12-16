import React from 'react'
import {Field, FieldArray, reduxForm, formValueSelector} from 'redux-form'
import { connect } from 'react-redux'
import validate from './validate'

const renderField = ({ input, label, type, className, meta: { touched, error } }) => (
  <input {...input} type={type} placeholder={label} className={className} />
);

const renderSelect = ({ input, className, children, meta: { touched, error } }) => (
  <select {...input} className={className}>
    {children}
  </select>
);

const renderOptions = ({ fields, select, myValues, meta: { error } }) => (
  <ul style={{ display: select ? "block" : "none" }}>
    <li>
      <button type="button" className={'btn btn-info'} onClick={() => fields.push()}>
        Add Select Option
      </button>
    </li>
    {fields.map((option, index) => (
      <li key={index}>
        <button
          type="button"
          title="Remove Option"
          className={'btn btn-danger'}
          onClick={() => fields.remove(index)}
        >
           -
        </button>
        <Field
          name={option}
          type="text"
          component={renderField}
          label={`Option #${index + 1}`}
        />
      </li>
    ))}
    {error && <li className="error">{error}</li>}
  </ul>
)

const renderMembers = ({ fields, myValues, meta: { error, submitFailed } }) => (
  <ul>
    {submitFailed && error && <span>{error}</span>}
    {fields.map((member, index) => (
      <li key={index}>
        <div className="input-group">
          <div className="input-group-prepend">
            <span className="input-group-text">Field #{index + 1}</span>
          </div>
          <Field
            name={`${member}.fieldTitle`}
            component={renderField}
            type={'text'}
            label="Field Title"
            className={'form-control'}
          />
          <Field
            name={`${member}.fieldType`}
            component={renderSelect}
            className='custom-select'
          >
            <option value="" disabled>Choose field type...</option>
            <option value="text">Text</option>
            <option value="select">Select</option>
            <option value="checkbox">Checkbox</option>
          </Field>
          <div className="input-group-append">
            <button
              className="btn btn-outline-danger"
              type="button"
              title="Remove Field"
              onClick={() => fields.remove(index)}
            >
              Remove
            </button>
          </div>
        </div>
        {myValues[index].fieldType === 'select' && <FieldArray
          name={`${member}.options`}
          component={renderOptions}
          select={member}
          myValues={myValues[index].fieldType}
        />}
      </li>
    ))}
  </ul>
)

let FieldArraysForm = props => {
  const { handleSubmit, pristine, reset, submitting, array, myValues } = props;
  return (
    <form onSubmit={handleSubmit}>
      <div className="input-group">
        <Field
          className={'form-control'}
          name="title"
          component={renderField}
          type={'text'}
          label="Position Title"
        />
        <div className="input-group-append">
          <button className={'btn btn-outline-success'} type="button" onClick={() => array.push('position_attributes', {})}>
            Add Position Field
          </button>
        </div>
      </div>
      <FieldArray name="position_attributes" component={renderMembers} myValues={myValues}/>
      <div>
        <button
          type="submit"
          className={'btn btn-success'}
          disabled={submitting}
        >
          Submit
        </button>
        <button type="button" className={'btn btn-danger'} disabled={pristine || submitting} onClick={reset}>
          Clear Values
        </button>
      </div>
    </form>
  )
}

FieldArraysForm = reduxForm({
  form: 'fieldArrays',
  validate
})(FieldArraysForm)

const selector = formValueSelector('fieldArrays')
FieldArraysForm = connect(state => ({
  myValues: selector(state, 'position_attributes')
  }))(FieldArraysForm)

export default FieldArraysForm