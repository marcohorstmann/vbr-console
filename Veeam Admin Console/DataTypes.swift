//
//  Item.swift
//  Veeam Admin Console
//
//  Created by Marco Horstmann on 19.03.24.
//

import Foundation
import SwiftData

@Model
final class VeeamAccess {
    var access_token: String
    //var token_type: String
    //var refresh_token: String
    //var expires_in: Int
    //var issued: String
    //var expires: String
    
    //var issued = ISO8601DateFormatter()
    //var issued = DateFormatter.date("2023-04-24T14:24:18")
    
    init(accessToken: String) {
        self.access_token = accessToken
    }
}


/*
struct BackupConfiguration {
    let isHighPriority: Bool
 
    let type: String
    let id: any Identifiable
    let name: String
    let description: String
    let isDisabled: Bool
}
*/



/*
 
 {
   "data": [
     {
       "isHighPriority": false,
       "virtualMachines": {
         "includes": [
           {
             "inventoryObject": {
               "type": "VirtualMachine",
               "hostName": "vcenter01.tech.local",
               "name": "filesrv02",
               "objectId": "vm-45006"
             },
             "size": "43.5 GB"
           }
         ],
         "excludes": {
           "vms": [],
           "disks": [
             {
               "disksToProcess": "AllDisks",
               "vmObject": {
                 "type": "VirtualMachine",
                 "hostName": "vcenter01.tech.local",
                 "name": "filesrv02",
                 "objectId": "vm-45006"
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
         "backupRepositoryId": "88101045-8755-4117-9221-bca81fbfabc4",
         "backupProxies": {
           "autoSelectEnabled": true,
           "proxyIds": []
         },
         "retentionPolicy": {
           "type": "Days",
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
             "isEnabled": true,
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
           "isEnabled": false,
           "appSettings": []
         },
         "guestFSIndexing": {
           "isEnabled": true,
           "indexingSettings": [
             {
               "vmObject": {
                 "type": "VirtualMachine",
                 "hostName": "vcenter01.tech.local",
                 "name": "filesrv02",
                 "objectId": "vm-45006"
               },
               "WindowsIndexing": {
                 "guestFSIndexingMode": "indexAllExcept",
                 "indexingList": [
                   "%windir%",
                   "%ProgramFiles%",
                   "%ProgramFiles(x86)%",
                   "%ProgramW6432%",
                   "%TEMP%"
                 ]
               },
               "LinuxIndexing": {
                 "guestFSIndexingMode": "indexAllExcept",
                 "indexingList": [
                   "/cdrom",
                   "/dev",
                   "/media",
                   "/mnt",
                   "/proc",
                   "/tmp",
                   "/lost+found"
                 ]
               }
             }
           ]
         },
         "guestInteractionProxies": {
           "autoSelectEnabled": true,
           "proxyIds": []
         },
         "guestCredentials": {
           "credentialsType": "Standard",
           "credentialsId": "4fbeb05c-c158-4510-84f3-6744554fb350",
           "credentialsPerMachine": []
         }
       },
       "schedule": {
         "runAutomatically": true,
         "daily": {
           "dailyKind": "Everyday",
           "isEnabled": true,
           "localTime": "10:00",
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
           "localTime": "10:00",
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
       "id": "ef1f0227-80e1-40f8-b2a2-5119172d2c36",
       "name": "Backup Job 2",
       "description": "Created by ENTERPRISE01\\Administrator",
       "isDisabled": false
     }
   ],
   "pagination": {
     "total": 3,
     "count": 1,
     "skip": 0,
     "limit": 1
   }
 }

 
 */
