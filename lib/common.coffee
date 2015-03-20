###
Generates a RFC compliante UUID string.

@return a random UUID string in the form of xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.
###
@cupenya =
  util:
    generateRandomUuid: ->
      "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace /[xy]/g, (c) ->
        r = Math.random() * 16 | 0
        v = (if c is "x" then r else (r & 0x3 | 0x8))
        v.toString 16


@randomOrder = =>
  randomEntry = (items) ->
    items[Math.floor(Math.random() * items.length)]

  randomDigit = -> Math.floor(Math.random() * 10)
  randomDigits = (count) ->
    str = ""
    while (count > 0)
      str += randomDigit()
      count -= 1
    str

  invoiceId: randomDigits(8)
  invoiceDate: "01.01.2013"
  amountDueOriginal: Math.floor(Math.random() * 100000) / 100
  partyName: randomEntry(@customerNames)
  accountNumber: randomDigits(12)
  accountType: randomEntry(["Small Account", "Medium Account", "Large Account", "Key Account", "Consumer Account"])
  lineOfBusiness: randomEntry(["Home Insurance", "Auto Insurance", "Life Insurance", "Employee Insurance", "Accident & Health Insurance", "Travel Insurance", "Retail Insurance", "Liability Insurance", "Property Insurance", "Disability Insurance", "Mortgage Insurance", "Environmental Insurance"])
  product1: randomEntry(["Individual Driver", "Group ", "Renters", "Homeowners", "Condo", "Universal Life", "Whole Life", "Term Life", "Disability Income", "Volunteer Accident", "NGOs", "Adventure Travel", "Travel Medical Expense", "Vacation", "International Travel", "Rental Car", "Airline Flight", "Entertainment & Hospitality", "Sports Accident", "Camping Accident", "Payroll", "Construction All-Risk", "Equipment Break-down", "Third-Party Liability", "Employee Liability", "General Liability", "General Property", "General Environmental", "Commercial Pollution", "Default Protection"])
  sourceName: randomEntry(["HRRA Floip", "Liability General Void", "Property District Void", "Travel AdLot VOid", "Life Void", "Travel Magazines Void", "Property VarJa Manual", "MNH APC", "Staff Training", "Property Void", "Property World Wide Manual", "Travel Advertisement Manual", "Universal Life Manual", "Miscellaneous Manual", "Home", "Property DW", "Property VarJa", "Travel Air Flight", "EMBA Excel", "Auto Excel", "Life Excel", "ONNs", "Travel Adventure", "MNH Travel Advertising", "Auto", "Life", "Property General Interface", "HRRA i", "Property Partner Companies", "Auto Manual ", "Travel E&E Manual", "Travel E&E"])
  processType: randomEntry(["Invoice Only","Auto Order"])
  disputedCase: randomEntry(["Disputed","Not Disputed"])
  delivery: randomEntry(["Full Automatic", "Backup Interface", "Manual", "Semi-Automatic", "Verbal"])
  disputeStatus: randomEntry([""])
  disputeReasonCode: randomEntry(["Unclear Definition", "Invoice/Attachment Not Received", "Invoiced Twice", "Incorrect Address Details", "Deceased", "VAT Incorrect", "Invoice inconsistencies", "Billed Incorrectly", "Left/Unknown", "Notification of Collections Sent ", "Incorrect Invoice Processing", "Negotiate Terms", "No Attachment", "Debt Payment Assistance", "Complaint Service Provided", "Incorrect Price", "Direct Debit Proposal", "Bill Sent Late", "Not Billed On Time", "Aged Trail Balance (Key Account)", "No Reason", "Incorrect Processing Reception", "Service Delivered Incorrectly", "Case Retail", "Left/Unknown Member", "Bankruptcy/Debt", "Debt Secured", "Not Ordered", "Proposal for Write-off", "Bankruptcy", "Amount Added", "Money Ceased", "Transfered to Specific Department", "Direct debit", "Case Insurance", "Incorrect Customer Invoice", "Medical Management", "Has paid otherwise", "Unclear Invoice Description", "No Receipt"])
