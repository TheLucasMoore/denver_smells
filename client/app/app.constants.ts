'use strict';
const angular = require('angular');

export default angular.module('denverSmellsApp.constants', [])
  .constant('appConfig', require('../../server/config/environment/shared'))
  .name;
