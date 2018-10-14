import { connect } from 'react-redux';
import NewPosition from '../components/NewPosition';
import * as actions from '../actions/positionActionCreators';

const mapStateToProps = (state) => ({
    position: state.position,
});

export default connect(mapStateToProps, actions)(NewPosition);
