//
//  JobView.swift
//  Veeam Admin Console
//
//  Created by Marco Horstmann on 19.03.24.
//


import SwiftUI

struct JobView: View {
    var body: some View {
        HStack {
            Text("This is job 1")
                .foregroundColor(.red)
            Spacer()
            Image(systemName: "play.fill")
                .foregroundColor(.green)
            Image(systemName: "triangle.fill")
                .foregroundColor(.yellow)
            Image(systemName: "x.square.fill")
                .foregroundColor(.red)
            Image(systemName: "slider.vertical.3")
                .foregroundColor(.black)
        }
        .padding()
        Spacer()
    }
}

#Preview("en") {
    JobView()
        .environment(\.locale, .init(identifier: "en"))
}
#Preview("de") {
    JobView()
        .environment(\.locale, .init(identifier: "de"))
}




/*
 
 {
   "isHighPriority": false,
   "virtualMachines": {
     "includes": [
       {
         "inventoryObject": {
           "type": "VirtualMachine",
           "hostName": "172.17.52.34",
           "name": "srv45",
           "objectId": "vm-61281"
         },
         "size": "152.5 GB"
       }
     ],
     "excludes": {
       "vms": [],
       "disks": [
         {
           "disksToProcess": "AllDisks",
           "vmObject": {
             "type": "VirtualMachine",
             "hostName": "172.17.52.34",
             "name": "srv45",
             "objectId": "vm-61281"
           },
           "disks": [],
           "removeFromVMConfiguration": true
         }
       ],
       "templates": {
         "isEnabled": true,
         "excludeFromIncremental": true
       }
     }
   },
   "storage": {
     "backupRepositoryId": "49607f55-4cc4-4ea5-a2c9-e750318d0f34",
     "backupProxies": {
       "autoSelectEnabled": true,
       "proxyIds": []
     },
     "retentionPolicy": {
       "type": "RestorePoints",
       "quantity": 7
     },
     "gfsPolicy": {
       "isEnabled": false,
       "weekly": {
         "desiredTime": "sunday",
         "isEnabled": false,
         "keepForNumberOfWeeks": 1
       },
       "monthly": {
         "desiredTime": "First",
         "isEnabled": false,
         "keepForNumberOfMonths": 1
       },
       "yearly": {
         "desiredTime": "January",
         "isEnabled": false,
         "keepForNumberOfYears": 1
       }
     },
     "advancedSettings": {
       "backupModeType": "Incremental",
       "synthenticFulls": {
         "isEnabled": false,
         "days": [
           "saturday"
         ]
       },
       "activeFulls": {
         "isEnabled": false,
         "weekly": {
           "isEnabled": true,
           "days": [
             "saturday"
           ]
         },
         "monthly": {
           "dayOfWeek": "monday",
           "dayNumberInMonth": "First",
           "isEnabled": false,
           "dayOfMonths": 1,
           "months": [
             "January",
             "February",
             "March",
             "April",
             "May",
             "June",
             "July",
             "August",
             "September",
             "October",
             "November",
             "December"
           ]
         }
       },
       "backupHealth": {
         "isEnabled": false,
         "weekly": {
           "isEnabled": false,
           "days": [
             "friday"
           ]
         },
         "monthly": {
           "dayOfWeek": "friday",
           "dayNumberInMonth": "Last",
           "isEnabled": true,
           "dayOfMonths": 1,
           "months": [
             "January",
             "February",
             "March",
             "April",
             "May",
             "June",
             "July",
             "August",
             "September",
             "October",
             "November",
             "December"
           ]
         }
       },
       "fullBackupMaintenance": {
         "RemoveData": {
           "isEnabled": false,
           "afterDays": 14
         },
         "defragmentAndCompact": {
           "isEnabled": false,
           "weekly": {
             "isEnabled": false,
             "days": [
               "saturday"
             ]
           },
           "monthly": {
             "dayOfWeek": "saturday",
             "dayNumberInMonth": "Last",
             "isEnabled": true,
             "dayOfMonths": 1,
             "months": [
               "January",
               "February",
               "March",
               "April",
               "May",
               "June",
               "July",
               "August",
               "September",
               "October",
               "November",
               "December"
             ]
           }
         }
       },
       "storageData": {
         "compressionLevel": "Optimal",
         "storageOptimization": "LocalTarget",
         "inlineDataDedupEnabled": true,
         "excludeSwapFileBlocks": true,
         "excludeDeletedFileBlocks": true,
         "encryption": {
           "isEnabled": false,
           "encryptionPasswordId": "00000000-0000-0000-0000-000000000000",
           "encryptionPasswordUniqueId": null
         }
       },
       "notifications": {
         "sendSNMPNotifications": false,
         "emailNotifications": {
           "notificationType": null,
           "isEnabled": false,
           "recipients": [],
           "customNotificationSettings": null
         },
         "vmAttribute": {
           "isEnabled": false,
           "notes": "Notes",
           "appendToExistingValue": true
         }
       },
       "vSphere": {
         "enableVMWareToolsQuiescence": false,
         "changedBlockTracking": {
           "isEnabled": true,
           "enableCBTautomatically": true,
           "resetCBTonActiveFull": true
         }
       },
       "storageIntegration": {
         "isEnabled": true,
         "processedVmsLimitEnabled": false,
         "processedVmsCount": 10,
         "failoverToStandardBackup": false
       },
       "scripts": {
         "periodicityType": "BackupSessions",
         "preCommand": {
           "isEnabled": false,
           "command": ""
         },
         "postCommand": {
           "isEnabled": false,
           "command": ""
         },
         "runScriptEvery": 1,
         "dayOfWeek": [
           "saturday"
         ]
       }
     }
   },
   "guestProcessing": {
     "appAwareProcessing": {
       "isEnabled": true,
       "appSettings": [
         {
           "vss": "requireSuccess",
           "transactionLogs": "process",
           "vmObject": {
             "type": "VirtualMachine",
             "hostName": "172.17.52.34",
             "name": "srv45",
             "objectId": "vm-61281"
           },
           "usePersistentGuestAgent": false,
           "sql": {
             "logsProcessing": "truncate",
             "retainLogBackups": null,
             "backupMinsCount": null,
             "keepDaysCount": null,
             "logShippingServers": null
           },
           "oracle": {
             "archiveLogs": "preserve",
             "retainLogBackups": "untilBackupDeleted",
             "useGuestCredentials": true,
             "credentialsId": null,
             "deleteHoursCount": null,
             "deleteGBsCount": null,
             "backupLogs": true,
             "backupMinsCount": 15,
             "keepDaysCount": 15,
             "logShippingServers": {
               "autoSelection": true,
               "shippingServerIds": []
             }
           },
           "exclusions": {
             "exclusionPolicy": "disabled",
             "itemsList": []
           },
           "scripts": {
             "scriptProcessingMode": "disableExec",
             "windowsScripts": null,
             "linuxScripts": null
           }
         }
       ]
     },
     "guestFSIndexing": {
       "isEnabled": false,
       "indexingSettings": []
     },
     "guestInteractionProxies": {
       "autoSelectEnabled": true,
       "proxyIds": []
     },
     "guestCredentials": {
       "credentialsType": "Standard",
       "credentialsId": "6454c893-d5c6-4de8-be38-d984ea30dae4",
       "credentialsPerMachine": []
     }
   },
   "schedule": {
     "runAutomatically": true,
     "daily": {
       "dailyKind": "Everyday",
       "isEnabled": true,
       "localTime": "4:00",
       "days": [
         "sunday",
         "monday",
         "tuesday",
         "wednesday",
         "thursday",
         "friday",
         "saturday"
       ]
     },
     "monthly": {
       "dayOfWeek": "saturday",
       "dayNumberInMonth": "Fourth",
       "isEnabled": false,
       "localTime": "9:00",
       "dayOfMonth": 1,
       "months": [
         "January",
         "February",
         "March",
         "April",
         "May",
         "June",
         "July",
         "August",
         "September",
         "October",
         "November",
         "December"
       ]
     },
     "periodically": {
       "periodicallyKind": "Hours",
       "isEnabled": false,
       "frequency": 1,
       "backupWindow": {
         "days": [
           {
             "day": "sunday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "monday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "tuesday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "wednesday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "thursday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "friday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "saturday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           }
         ]
       },
       "startTimeWithinAnHour": 0
     },
     "continuously": {
       "isEnabled": false,
       "backupWindow": {
         "days": [
           {
             "day": "sunday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "monday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "tuesday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "wednesday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "thursday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "friday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "saturday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           }
         ]
       }
     },
     "afterThisJob": {
       "isEnabled": false,
       "jobName": null
     },
     "retry": {
       "isEnabled": true,
       "retryCount": 3,
       "awaitMinutes": 10
     },
     "backupWindow": {
       "isEnabled": false,
       "backupWindow": {
         "days": [
           {
             "day": "sunday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "monday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "tuesday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "wednesday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "thursday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "friday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           },
           {
             "day": "saturday",
             "hours": "1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1"
           }
         ]
       }
     }
   },
   "type": "Backup",
   "id": "75fc491a-d158-4380-a433-ebc42a28e4df",
   "name": "Oracle Backup",
   "description": "Created by GAMMA\\Administrator",
   "isDisabled": false
 }
 
 */
