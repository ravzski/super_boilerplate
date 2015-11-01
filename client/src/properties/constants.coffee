@DATE_FORMAT = "MMM DD, YYYY"
@TIMESTAMP_FORMAT = "MMM DD, YYYY hh:mm:ss"
@DEFAULT_PER_PAGE = 10

@PRODUCT_STATUS_ALL= [
  {
    label: 'All'
    value: ''
  }
  {
    label: 'Active'
    value: 'true'
  }
  {
    label: 'Inactive'
    value: 'false'
  }

]


@PRODUCT_STATUS= [
  {
    label: 'Depleted'
    value: 'Depleted'
  }
  {
    label: 'Low'
    value: 'Low'
  }
  {
    label: 'Mid'
    value: 'Mid'
  }
  {
    label: 'High'
    value: 'High'
  }
]

@MONTHS = [
  {key: "1", value: "January"},
  {key: "2", value: "Feburary"},
  {key: "3", value: "March"},
  {key: "4", value: "April"},
  {key: "5", value: "May"},
  {key: "6", value: "June"},
  {key: "7", value: "July"},
  {key: "8", value: "Augugust"},
  {key: "9", value: "September"},
  {key: "10", value: "October"},
  {key: "11", value: "November"},
  {key: "12", value: "December"}
]

@DIVISIONS = [
  {key: "1", value: "1st Half"},
  {key: "2", value: "2nd Half"}
]

@MESSAGES =
  UPDATE_SUCCESS: "Updated successfully"
  UPDATE_ERROR: "Update error"
  CREATE_SUCCESS: "Created successfully"
  DELETE_SUCCESS: "Deleted successfully"
  INTERNAL_SERVER_ERROR: "Error 500, internal server error"
  BAD_REQUEST: "Error 400, bad request"
  FORM_ERROR: "Marked fields are blank or have invalid value"
  INVALID_CREDS: "Invalid username or password"
  NO_DATA: "No more data to get"
  INVALID_FILE_SIZE: "File should be less than 10 mb"
  TIMEOUT: "Connection has timed out"
  LOGIN_SUCCESS: "Login success"
  LOGOUT_SUCCESS: "Logout success"
  NO_DATA: "No more data to get"
  NEW_NOTIFICATION: "New Notification"

@DELETE_WARNING = {
    title: 'Are you sure?'
    text: 'You will not be able to recover this data'
    type: 'warning'
    showCancelButton: true
    confirmButtonColor: '#ff604f'
    confirmButtonText: 'Yes, delete it!'
    closeOnCancel: true
    closeOnConfirm: true
    animation: false
  }

@UPDATE_WARNING = {
    title: 'Are you sure?'
    text: 'Make sure all data are correct'
    type: 'warning'
    showCancelButton: true
    confirmButtonColor: '#FCC44D'
    confirmButtonText: 'Yes, update it!'
    closeOnCancel: true
    closeOnConfirm: true
    animation: false
  }


@WITHOUT_INFO_REQUEST = {
    title: 'Warning'
    text: 'Finalize without any copy of regulator information request?'
    type: 'warning'
    showCancelButton: true
    confirmButtonColor: '#ff604f'
    confirmButtonText: 'Yes, Finalize it!'
    closeOnCancel: true
    closeOnConfirm: true
    animation: false
  }
