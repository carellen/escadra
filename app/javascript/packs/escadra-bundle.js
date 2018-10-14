import ReactOnRails from 'react-on-rails';

import positionStore from '../bundles/Position/store/positionStore';

import NewPosition from '../bundles/Position/startup/NewPosition';
import UpdatePosition from '../bundles/Position/startup/UpdatePosition';

ReactOnRails.register({
  NewPosition,
  UpdatePosition
});

ReactOnRails.registerStore({
  positionStore
});
