CREATE TABLE [umbracoUserType] (
  [id] int NOT NULL  IDENTITY (5,1)
, [userTypeAlias] nvarchar(50) NULL
, [userTypeName] nvarchar(255) NOT NULL
, [userTypeDefaultPermissions] nvarchar(50) NULL
);
GO
CREATE TABLE [umbracoUserLogins] (
  [contextID] uniqueidentifier NOT NULL
, [userID] int NOT NULL
, [timeout] bigint NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodePermission] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoUser] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userDisabled] bit NOT NULL DEFAULT (0)
, [userNoConsole] bit NOT NULL DEFAULT (0)
, [userType] int NOT NULL
, [startStructureID] int NOT NULL
, [startMediaID] int NULL
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(125) NOT NULL
, [userEmail] nvarchar(255) NOT NULL
, [userDefaultPermissions] nvarchar(50) NULL
, [userLanguage] nvarchar(10) NULL
, [defaultToLiveEditing] bit NOT NULL DEFAULT (0)
);
GO
CREATE TABLE [umbracoUser2app] (
  [user] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int NOT NULL  IDENTITY (2,1)
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NOT NULL
, [childObjectType] uniqueidentifier NOT NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int NOT NULL  IDENTITY (1,1)
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime NOT NULL DEFAULT (getdate())
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int NOT NULL  IDENTITY (1073,1)
, [trashed] bit NOT NULL DEFAULT (0)
, [parentID] int NOT NULL
, [nodeUser] int NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [uniqueID] uniqueidentifier NULL
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime NOT NULL DEFAULT (getdate())
);
GO
CREATE TABLE [umbracoLog] (
  [id] int NOT NULL  IDENTITY (103,1)
, [userId] int NOT NULL
, [NodeId] int NOT NULL
, [Datestamp] datetime NOT NULL DEFAULT (getdate())
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int NOT NULL  IDENTITY (2,1)
, [languageISOCode] nvarchar(10) NULL
, [languageCultureName] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoDomains] (
  [id] int NOT NULL  IDENTITY (1,1)
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoAppTree] (
  [treeSilent] bit NOT NULL DEFAULT (0)
, [treeInitialize] bit NOT NULL DEFAULT (1)
, [treeSortOrder] tinyint NOT NULL
, [appAlias] nvarchar(50) NOT NULL
, [treeAlias] nvarchar(150) NOT NULL
, [treeTitle] nvarchar(255) NOT NULL
, [treeIconClosed] nvarchar(255) NOT NULL
, [treeIconOpen] nvarchar(255) NOT NULL
, [treeHandlerAssembly] nvarchar(255) NOT NULL
, [treeHandlerType] nvarchar(255) NOT NULL
, [action] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoApp] (
  [sortOrder] tinyint NOT NULL DEFAULT (0)
, [appAlias] nvarchar(50) NOT NULL
, [appIcon] nvarchar(255) NOT NULL
, [appName] nvarchar(255) NOT NULL
, [appInitWithTreeAlias] nvarchar(255) NULL
);
GO
CREATE TABLE [Comment] (
  [id] int NOT NULL  IDENTITY (1,1)
, [mainid] int NOT NULL
, [nodeid] int NOT NULL
, [name] nvarchar(250) NULL
, [email] nvarchar(250) NULL
, [website] nvarchar(250) NULL
, [comment] ntext NULL
, [spam] bit NULL
, [ham] bit NULL
, [created] datetime NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int NOT NULL  IDENTITY (11,1)
, [nodeId] int NOT NULL
, [master] int NULL
, [alias] nvarchar(100) NULL
, [design] ntext NOT NULL
);
GO
CREATE TABLE [cmsTaskType] (
  [id] int NOT NULL  IDENTITY (2,1)
, [alias] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsTask] (
  [closed] bit NOT NULL DEFAULT ((0))
, [id] int NOT NULL  IDENTITY (1,1)
, [taskTypeId] int NOT NULL
, [nodeId] int NOT NULL
, [parentUserId] int NOT NULL
, [userId] int NOT NULL
, [DateTime] datetime NOT NULL DEFAULT (getdate())
, [Comment] nvarchar(500) NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int NOT NULL  IDENTITY (2,1)
, [tag] nvarchar(200) NULL
, [parentId] int NULL
, [group] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
);
GO
CREATE TABLE [cmsTab] (
  [id] int NOT NULL  IDENTITY (18,1)
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
);
GO
CREATE TABLE [cmsStylesheetProperty] (
  [nodeId] int NOT NULL
, [stylesheetPropertyEditor] bit NULL
, [stylesheetPropertyAlias] nvarchar(50) NULL
, [stylesheetPropertyValue] nvarchar(400) NULL
);
GO
CREATE TABLE [cmsStylesheet] (
  [nodeId] int NOT NULL
, [filename] nvarchar(100) NOT NULL
, [content] ntext NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int NOT NULL  IDENTITY (47,1)
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [tabId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [helpText] nvarchar(1000) NULL
, [sortOrder] int NOT NULL DEFAULT (0)
, [mandatory] bit NOT NULL DEFAULT (0)
, [validationRegExp] nvarchar(255) NULL
, [Description] nvarchar(2000) NULL
);
GO
CREATE TABLE [cmsPropertyData] (
  [id] int NOT NULL  IDENTITY (69,1)
, [contentNodeId] int NOT NULL
, [versionId] uniqueidentifier NULL
, [propertytypeid] int NOT NULL
, [dataInt] int NULL
, [dataDate] datetime NULL
, [dataNvarchar] nvarchar(500) NULL
, [dataNtext] ntext NULL
);
GO
CREATE TABLE [cmsPreviewXml] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [timestamp] datetime NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit NOT NULL DEFAULT (0)
, [viewOnProfile] bit NOT NULL DEFAULT (0)
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) NOT NULL DEFAULT ('')
, [LoginName] nvarchar(1000) NOT NULL DEFAULT ('')
, [Password] nvarchar(1000) NOT NULL DEFAULT ('')
);
GO
CREATE TABLE [cmsMacroPropertyType] (
  [id] int NOT NULL  IDENTITY (26,1)
, [macroPropertyTypeAlias] nvarchar(50) NULL
, [macroPropertyTypeRenderAssembly] nvarchar(255) NULL
, [macroPropertyTypeRenderType] nvarchar(255) NULL
, [macroPropertyTypeBaseType] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int NOT NULL  IDENTITY (8,1)
, [macroPropertyHidden] bit NOT NULL DEFAULT (0)
, [macroPropertyType] int NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] tinyint NOT NULL DEFAULT (0)
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int NOT NULL  IDENTITY (22,1)
, [macroUseInEditor] bit NOT NULL DEFAULT (0)
, [macroRefreshRate] int NOT NULL DEFAULT (0)
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroScriptType] nvarchar(255) NULL
, [macroScriptAssembly] nvarchar(255) NULL
, [macroXSLT] nvarchar(255) NULL
, [macroCacheByPage] bit NOT NULL DEFAULT (1)
, [macroCachePersonalized] bit NOT NULL DEFAULT (0)
, [macroDontRender] bit NOT NULL DEFAULT (0)
, [macroPython] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit NOT NULL DEFAULT (0)
);
GO
CREATE TABLE [cmsDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [documentUser] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [text] nvarchar(255) NOT NULL
, [releaseDate] datetime NULL
, [expireDate] datetime NULL
, [updateDate] datetime NOT NULL DEFAULT (getdate())
, [templateId] int NULL
, [alias] nvarchar(255) NULL
, [newest] bit NOT NULL DEFAULT (0)
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NOT NULL
, [key] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsDataTypePreValues] (
  [id] int NOT NULL  IDENTITY (5,1)
, [datatypeNodeId] int NOT NULL
, [value] nvarchar(2500) NULL
, [sortorder] int NOT NULL
, [alias] nvarchar(50) NULL
);
GO
CREATE TABLE [cmsDataType] (
  [pk] int NOT NULL  IDENTITY (40,1)
, [nodeId] int NOT NULL
, [controlId] uniqueidentifier NOT NULL
, [dbType] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [cmsContentXml] (
  [nodeId] int NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsContentVersion] (
  [id] int NOT NULL  IDENTITY (28,1)
, [ContentId] int NOT NULL
, [VersionId] uniqueidentifier NOT NULL
, [VersionDate] datetime NOT NULL DEFAULT (getdate())
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int NOT NULL  IDENTITY (542,1)
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) NOT NULL DEFAULT ('folder.png')
, [description] nvarchar(1500) NULL
, [masterContentType] int NULL DEFAULT (0)
);
GO
CREATE TABLE [cmsContent] (
  [pk] int NOT NULL  IDENTITY (13,1)
, [nodeId] int NOT NULL
, [contentType] int NOT NULL
);
GO
SET IDENTITY_INSERT [umbracoUserType] ON;
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (2,N'writer',N'Writer',N'CAH:F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (3,N'editor',N'Editors',N'CADMOSKTPUZ:5F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (4,N'translator',N'Translator',N'AF');
GO
SET IDENTITY_INSERT [umbracoUserType] OFF;
GO
INSERT INTO [umbracoUserLogins] ([contextID],[userID],[timeout]) VALUES ('56920cf5-d5f1-4cea-9981-e39f1cb0045b',0,634934165988878186);
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userType],[startStructureID],[startMediaID],[userName],[userLogin],[userPassword],[userEmail],[userDefaultPermissions],[userLanguage],[defaultToLiveEditing]) VALUES (0,0,0,1,-1,-1,N'admin',N'admin',N'd9xnUXsUah9gycu7D0TpRYcx19c=',N'admin@domain.com',NULL,N'en',0);
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'content');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'developer');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'media');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'member');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'settings');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'users');
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (1,1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-92,0,-1,0,11,N'-1,-92',37,'f0bc4bfb-b499-40d6-ba86-058885a5178c',N'Label','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-09-30 14:01:49.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-90,0,-1,0,11,N'-1,-90',35,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-09-30 14:01:49.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-89,0,-1,0,11,N'-1,-89',34,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',N'Textbox multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-09-30 14:01:49.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-88,0,-1,0,11,N'-1,-88',33,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-09-30 14:01:49.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-87,0,-1,0,11,N'-1,-87',32,'ca90c950-0aff-4e72-b976-a30b1ac57dad',N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-09-30 14:01:49.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-51,0,-1,0,11,N'-1,-51',4,'2e6d3631-066e-44b8-aec4-96f09099b2b5',N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-09-30 14:01:49.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-49,0,-1,0,11,N'-1,-49',2,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',N'True/false','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-09-30 14:01:49.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-43,0,-1,0,1,N'-1,-43',2,'fbaf13a8-4036-41f2-93a3-974f678c312a',N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-10-15 14:11:04.367'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-42,0,-1,0,1,N'-1,-42',2,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-10-15 14:10:59.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-41,0,-1,0,1,N'-1,-41',2,'5046194e-4237-453c-a547-15db3a07c4e1',N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-10-15 14:10:54.303'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-40,0,-1,0,1,N'-1,-40',2,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-10-15 14:10:49.253'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-39,0,-1,0,1,N'-1,-39',2,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-10-15 14:10:44.480'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-38,0,-1,0,1,N'-1,-38',2,'fd9f1447-6c61-4a7c-9595-5aa39147d318',N'Folder Browser','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-10-15 14:10:37.020'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-37,0,-1,0,1,N'-1,-37',2,'0225af17-b302-49cb-9176-b9f35cab9c17',N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-10-15 14:10:30.580'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-36,0,-1,0,1,N'-1,-36',2,'e4d66c0f-b935-4200-81f0-025f7256b89a',N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2004-10-15 14:10:23.007'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-1,0,-1,0,0,N'-1',0,'916724a5-173d-4619-b97e-b9de133dd6f5',N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2004-09-30 14:01:49.920'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1031,0,-1,1,1,N'-1,1031',2,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2004-12-01 00:13:40.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1032,0,-1,1,1,N'-1,1032',2,'cc07b313-0843-4aa8-bbda-871c8da728c8',N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2004-12-01 00:13:43.737'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1033,0,-1,1,1,N'-1,1033',2,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2004-12-01 00:13:46.210'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1034,0,-1,0,1,N'-1,1034',2,'a6857c73-d6e9-480c-b6e6-f15f6ad11125',N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2006-01-03 13:07:29.203'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1035,0,-1,0,1,N'-1,1035',2,'93929b9a-93a2-4e2a-b239-d99334440a59',N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2006-01-03 13:07:36.143'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1036,0,-1,0,1,N'-1,1036',2,'2b24165f-9782-4aa3-b459-1de4a4d21f60',N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2006-01-03 13:07:40.260'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1038,0,-1,0,1,N'-1,1038',2,'1251c96c-185c-4e9b-93f4-b48205573cbd',N'Simple Editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2006-01-03 13:07:55.250'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1039,0,-1,0,1,N'-1,1039',2,'06f349a9-c949-4b6a-8660-59c10451af42',N'Ultimate Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2006-01-03 13:07:55.250'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1040,0,-1,0,1,N'-1,1040',2,'21e798da-e06e-4eda-a511-ed257f78d4fa',N'Related Links','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2006-01-03 13:07:55.250'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1041,0,-1,0,1,N'-1,1041',2,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2006-01-03 13:07:55.250'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-20,0,-1,0,0,N'-1,-20',0,'0f582a79-1e41-4cf0-bfa0-76340651891a',N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2013-01-10 11:40:00.407'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-21,0,-1,0,0,N'-1,-21',0,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2013-01-10 11:40:00.420'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1042,0,-1,0,1,N'-1,1042',0,'50d985c6-41fe-4bf2-90c1-e421907f54d2',N'Author Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2013-01-10 11:40:41.627'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1043,0,-1,0,1,N'-1,1043',0,'0b345dbd-238d-4acd-962f-d3442a55c94f',N'Blog Datefolder','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:45.320'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1044,0,-1,0,1,N'-1,1044',0,'2c4d6a45-6ac2-4a93-94a2-60832dbcf1dd',N'Blog post','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:45.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1045,0,-1,0,1,N'-1,1045',0,'0de93dae-b7c5-4002-ad7b-50ac5fc55cf1',N'CommentRss','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:46.023'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1046,0,-1,0,1,N'-1,1046',0,'47c1198c-70ef-4a39-9415-af5b66d9744c',N'Business Homepage','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:46.347'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1047,0,-1,0,1,N'-1,1047',0,'85fb17ea-ea68-4dbb-817c-8b53e0a57968',N'Homepage','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:46.667'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1048,0,-1,0,1,N'-1,1048',0,'9dc74e25-20e4-4052-8559-c424f1bbf35f',N'News','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:46.993'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1049,0,-1,0,1,N'-1,1049',0,'9eaca9c4-2633-4051-986a-f9dafa5ed6e8',N'News Article','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:47.317'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1050,0,-1,0,1,N'-1,1050',0,'57efce3d-c800-43b3-b015-16f8cc9b8e39',N'Rss','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:47.663'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1051,0,-1,0,1,N'-1,1051',0,'28814a9c-3c69-4fce-99a9-c20af4b0233b',N'Starterkit Master','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:48.007'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1052,0,-1,0,1,N'-1,1052',0,'3dac53d0-5d1d-4697-bf9d-0f75d520a3c6',N'Textpage','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2013-01-10 11:40:48.357'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1053,0,-1,0,1,N'-1,1053',0,'f23acb57-e99a-4e87-a5a7-661b7d5cd996',N'Blog','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2013-01-10 11:40:48.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1054,0,-1,0,1,N'-1,1054',0,'f17a7159-7e27-4498-a62e-ee6707f32109',N'Blog Post','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2013-01-10 11:40:49.620'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1055,0,-1,0,1,N'-1,1055',0,'bda218b6-0db6-4eca-9555-907d1ac505f2',N'DateFolder','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2013-01-10 11:40:49.980'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1056,0,-1,0,1,N'-1,1056',0,'783bb98a-302c-4603-95bd-394a3e2478f6',N'Homepage','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2013-01-10 11:40:50.193'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1057,0,-1,0,1,N'-1,1057',0,'ab2195b9-f806-481b-bc6c-06fc07b5c66d',N'News Area','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2013-01-10 11:40:50.390'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1058,0,-1,0,1,N'-1,1058',0,'22e3905f-2f7c-4f03-b4b1-c8ac8d691ec6',N'News Article','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2013-01-10 11:40:50.527'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1059,0,-1,0,1,N'-1,1059',0,'7f4e28d6-b062-44cb-8225-0916aed1b4ea',N'Textpage','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2013-01-10 11:40:50.707'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1060,0,-1,0,1,N'-1,1060',0,'347ebb18-0da5-4944-83a9-30340d80b560',N'Starterkit','9f68da4f-a3a8-44c2-8226-dcbd125e4840',{ts '2013-01-10 11:40:50.983'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1061,0,-1,0,1,N'-1,1061',0,'5c02e465-a4d1-459f-b858-2ac8be534ab0',N'Business Site','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:19:39.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1062,0,1061,0,2,N'-1,1061,1062',0,'e4b3ebcf-74a2-4b58-8d4f-31dc571966b7',N'Company News','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:22:05.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1063,0,1062,0,3,N'-1,1061,1062,1063',0,'dff143b2-ad5e-4647-b287-19ccaeea8572',N'Another record year','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:22:21.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1064,0,1062,0,3,N'-1,1061,1062,1064',1,'40ec98a0-e867-4ba7-8fe5-7b4610fa3d70',N'Finance department news','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:22:35.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1065,0,1062,0,3,N'-1,1061,1062,1065',2,'587bc2fd-1665-4103-a839-abc3bd4a4a62',N'Stocks are up','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:22:53.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1066,0,1061,0,2,N'-1,1061,1066',1,'560712d7-9ec9-49c5-bd52-452d42142ba8',N'Company Blog','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:26:10.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1067,0,1066,0,3,N'-1,1061,1066,1067',0,'a1d4e8a2-9e57-453e-82fa-20f9dfddf960',N'Company blog post','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:31:05.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1068,0,1061,0,2,N'-1,1061,1068',2,'9b969602-93f0-4c40-ba97-fb2976ead373',N'About','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:53:39.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1069,0,1068,0,3,N'-1,1061,1068,1069',0,'90f3a715-e699-4d8a-98e6-5e2453d421f5',N'Installing runway modules','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:19:40.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1070,0,1068,0,3,N'-1,1061,1068,1070',1,'c7686ef3-dd44-42c4-9415-0ed5b1879bad',N'Go further','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:19:40.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1071,0,1068,0,3,N'-1,1061,1068,1071',2,'32f8e215-a8d8-49a8-8357-311ea44f55f0',N'Getting started','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:19:40.000'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1072,0,1061,0,2,N'-1,1061,1072',3,'82186e37-c006-4244-b5c2-fb88cb3fa763',N'Contact us','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2010-09-07 13:20:06.000'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (1,0,-1,{ts '2013-01-10 11:40:00.477'},N'System',N'Loading content from database...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (2,0,-1,{ts '2013-01-10 11:40:00.483'},N'Debug',N'Republishing starting');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (3,0,-1,{ts '2013-01-10 11:40:00.487'},N'Debug',N'Xml Pages loaded');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (4,0,-1,{ts '2013-01-10 11:40:00.490'},N'Debug',N'Done republishing Xml Index');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (5,0,-1,{ts '2013-01-10 11:40:00.557'},N'Debug',N'Xml saved in 00:00:00.0073186');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (6,0,-1,{ts '2013-01-10 11:40:00.570'},N'Debug',N'Xml saved in 00:00:00.0024964');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (7,0,-1,{ts '2013-01-10 11:40:11.080'},N'Login',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (8,0,-1,{ts '2013-01-10 11:40:28.683'},N'System',N'Log scrubbed.  Removed all items older than 2012-11-11 11:40:28');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (9,0,-1,{ts '2013-01-10 11:40:32.057'},N'System',N'Loading content from disk cache...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (10,0,-1,{ts '2013-01-10 11:40:32.390'},N'Custom',N'[UmbracoExamine] Adding examine event handlers for index providers: 3');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (11,0,-1,{ts '2013-01-10 11:40:32.957'},N'System',N'Log scrubbed.  Removed all items older than 2012-11-11 11:40:32');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (12,0,-1,{ts '2013-01-10 11:40:35.457'},N'System',N'Loading content from disk cache...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (13,0,-1,{ts '2013-01-10 11:40:35.853'},N'Custom',N'[UmbracoExamine] Adding examine event handlers for index providers: 3');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (14,0,1061,{ts '2013-01-10 11:40:51.037'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (15,0,1062,{ts '2013-01-10 11:40:51.227'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (16,0,1063,{ts '2013-01-10 11:40:51.283'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (17,0,1064,{ts '2013-01-10 11:40:51.360'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (18,0,1065,{ts '2013-01-10 11:40:51.430'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (19,0,1066,{ts '2013-01-10 11:40:51.650'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (20,0,1067,{ts '2013-01-10 11:40:52.027'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (21,0,1068,{ts '2013-01-10 11:40:52.253'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (22,0,1068,{ts '2013-01-10 11:40:52.407'},N'Error',N'Couldn''t import property ''asdasd'' as the property type doesn''t exist on this document type');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (23,0,1069,{ts '2013-01-10 11:40:52.520'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (24,0,1069,{ts '2013-01-10 11:40:52.667'},N'Error',N'Couldn''t import property ''asdasd'' as the property type doesn''t exist on this document type');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (25,0,1070,{ts '2013-01-10 11:40:52.797'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (26,0,1070,{ts '2013-01-10 11:40:52.963'},N'Error',N'Couldn''t import property ''asdasd'' as the property type doesn''t exist on this document type');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (27,0,1071,{ts '2013-01-10 11:40:53.167'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (28,0,1071,{ts '2013-01-10 11:40:53.287'},N'Error',N'Couldn''t import property ''asdasd'' as the property type doesn''t exist on this document type');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (29,0,1072,{ts '2013-01-10 11:40:53.427'},N'New',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (30,0,1072,{ts '2013-01-10 11:40:53.553'},N'Error',N'Couldn''t import property ''asdasd'' as the property type doesn''t exist on this document type');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (31,0,-1,{ts '2013-01-10 11:40:53.633'},N'Debug',N'&lt;Action runat=&quot;install&quot; alias=&quot;addXsltExtension&quot; assembly=&quot;umbraco.editorControls&quot; type=&quot;umbraco.editorControls.tags.library&quot; extensionAlias=&quot;tagsLib&quot; /&gt;');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (32,0,-1,{ts '2013-01-10 11:40:53.647'},N'Debug',N'&lt;Action runat=&quot;install&quot; alias=&quot;addXsltExtension&quot; assembly=&quot;Runway.Blog&quot; type=&quot;Runway.Blog.BlogLibrary&quot; extensionAlias=&quot;BlogLibrary&quot; /&gt;');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (33,0,-1,{ts '2013-01-10 11:40:53.650'},N'Debug',N'&lt;Action runat=&quot;install&quot; alias=&quot;blog_addRestExtension&quot;&gt;&lt;ext assembly=&quot;Runway.Blog&quot; type=&quot;Runway.Blog.Library.Base&quot; alias=&quot;umbBlog&quot;&gt;&lt;permission method=&quot;CreateComment&quot; returnXml=&quot;false&quot; allowAll=&quot;true&quot; /&gt;&lt;permission method=&quot;GetGravatarImage&quot; returnXml=&quot;false&quot; allowAll=&quot;true&quot; /&gt;&lt;/ext&gt;&lt;/Action&gt;');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (34,0,-1,{ts '2013-01-10 11:40:53.653'},N'Debug',N'&lt;Action runat=&quot;install&quot; undo=&quot;true&quot; alias=&quot;AddUrlRewriteRule&quot;&gt;&lt;add name=&quot;rsstagrewrite&quot; virtualUrl=&quot;^~/blog/rss/tags/(.*).aspx&quot; rewriteUrlParameter=&quot;ExcludeFromClientQueryString&quot; destinationUrl=&quot;~/blog/rss.aspx?tag=$1&quot; ignoreCase=&quot;true&quot; /&gt;&lt;/Action&gt;');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (35,0,-1,{ts '2013-01-10 11:40:53.657'},N'Debug',N'&lt;Action runat=&quot;install&quot; alias=&quot;blog_executeNonQuery&quot;&gt;&lt;Sqlserver&gt;&lt;![CDATA[      	
     		CREATE TABLE [Comment](
     			  [id] [int] IDENTITY(1,1) NOT NULL CONSTRAINT [PK_Comment] PRIMARY KEY ,
     			  [mainid] [int] NOT NULL,
     			  [nodeid] [int] NOT NULL,
     			  [name] [nvarchar](250) NULL,
     			  [email] [nvarchar](250) NULL,
     			  [website] [nvarchar](250) NULL,
     			  [comment] [ntext] NULL,
     			  [spam] [bit] NULL,
     			  [ham] [bit] NULL,
     			  [created] [datetime] NULL
     				);
		  ]]&gt;&lt;/Sqlserver&gt;&lt;VistaDB&gt;&lt;![CDATA[
		  CREATE TABLE [Comment]
		  (
		  [id] INT NOT NULL PRIMARY KEY,
		  [mainid] INT NOT NULL,
		  [nodeid] INT NOT NULL,
		  [name] NVARCHAR (250),
		  [email] NVARCHAR (250),
		  [website] NVARCHAR (250),
		  [comment] NTEXT,
		  [spam] BIT,
		  [ham] BIT,
		  [created] DATETIME
		  );

		  ALTER TABLE [Comment]
		  ALTER COLUMN [id] INT NOT NULL IDENTITY (1, 1);
		  ]]&gt;&lt;/VistaDB&gt;&lt;MySQL&gt;&lt;![CDATA[
		  CREATE TABLE Comment (
		  id INTEGER UNSIGNED DEFAULT NULL AUTO_INCREMENT,
		  mainid INTEGER UNSIGNED NOT NULL,
		  nodeid INTEGER UNSIGNED NOT NULL,
		  name VARCHAR(250),
		  email VARCHAR(250),
		  website VARCHAR(250),
		  comment TEXT,
		  spam BOOLEAN,
		  ham BOOLEAN,
		  created DATETIME,
		  PRIMARY KEY (id)
		  );
		  ]]&gt;&lt;/MySQL&gt;&lt;/Action&gt;');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (36,0,-1,{ts '2013-01-10 11:40:53.670'},N'Debug',N'&lt;Action runat=&quot;install&quot; alias=&quot;publishRootDocument&quot; documentName=&quot;Business Site&quot; /&gt;');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (37,0,-1,{ts '2013-01-10 11:40:53.670'},N'Debug',N'&lt;Action runat=&quot;install&quot; alias=&quot;addDashboardSection&quot; dashboardAlias=&quot;Comments&quot;&gt;&lt;section&gt;&lt;areas&gt;&lt;area&gt;content&lt;/area&gt;&lt;/areas&gt;&lt;tab caption=&quot;Comments&quot;&gt;&lt;control&gt;/usercontrols/blog/CommentModeration.ascx&lt;/control&gt;&lt;/tab&gt;&lt;/section&gt;&lt;/Action&gt;');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (38,0,1061,{ts '2013-01-10 11:40:53.767'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (39,0,1062,{ts '2013-01-10 11:40:53.813'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (40,0,1063,{ts '2013-01-10 11:40:53.867'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (41,0,1064,{ts '2013-01-10 11:40:53.927'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (42,0,1065,{ts '2013-01-10 11:40:53.983'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (43,0,1066,{ts '2013-01-10 11:40:54.060'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (44,0,1067,{ts '2013-01-10 11:40:54.113'},N'Debug',N'Start Before Publish Event for Blog Post 1067');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (45,0,1067,{ts '2013-01-10 11:40:54.137'},N'Debug',N'Unable to determine top of Blog for BlogPost 1067 while attempting to move to new Post Date');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (46,0,-1,{ts '2013-01-10 11:40:54.183'},N'System',N'Loading content from database...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (47,0,-1,{ts '2013-01-10 11:40:54.183'},N'Debug',N'Republishing starting');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (48,0,-1,{ts '2013-01-10 11:40:54.203'},N'Debug',N'Xml Pages loaded');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (49,0,-1,{ts '2013-01-10 11:40:54.203'},N'Debug',N'Done republishing Xml Index');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (50,0,-1,{ts '2013-01-10 11:40:54.270'},N'Debug',N'Xml saved in 00:00:00.0106684');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (51,0,-1,{ts '2013-01-10 11:40:54.337'},N'Debug',N'Xml saved in 00:00:00.0171005');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (52,0,1067,{ts '2013-01-10 11:40:54.347'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (53,0,1068,{ts '2013-01-10 11:40:54.473'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (54,0,1069,{ts '2013-01-10 11:40:54.530'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (55,0,1070,{ts '2013-01-10 11:40:54.593'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (56,0,1071,{ts '2013-01-10 11:40:54.660'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (57,0,1072,{ts '2013-01-10 11:40:54.703'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (58,0,-1,{ts '2013-01-10 11:40:54.847'},N'Debug',N'Republishing starting');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (59,0,-1,{ts '2013-01-10 11:40:54.857'},N'Debug',N'Done republishing Xml Index');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (60,0,-1,{ts '2013-01-10 11:40:54.860'},N'System',N'Loading content from database...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (61,0,-1,{ts '2013-01-10 11:40:54.887'},N'Debug',N'Xml Pages loaded');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (62,0,-1,{ts '2013-01-10 11:40:54.913'},N'Debug',N'Xml saved in 00:00:00.0045672');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (63,0,-1,{ts '2013-01-10 11:40:54.927'},N'Debug',N'Xml saved in 00:00:00.0034576');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (64,0,-1,{ts '2013-01-10 11:42:15.793'},N'System',N'Loading content from database...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (65,0,-1,{ts '2013-01-10 11:42:15.803'},N'Debug',N'Republishing starting');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (66,0,-1,{ts '2013-01-10 11:42:15.843'},N'Debug',N'Xml Pages loaded');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (67,0,-1,{ts '2013-01-10 11:42:15.867'},N'Debug',N'Done republishing Xml Index');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (68,0,-1,{ts '2013-01-10 11:42:16.043'},N'Debug',N'Xml saved in 00:00:00.0248290');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (69,0,-1,{ts '2013-01-10 11:42:16.203'},N'Debug',N'Xml saved in 00:00:00.0246613');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (70,0,-1,{ts '2013-01-10 11:42:17.270'},N'System',N'Log scrubbed.  Removed all items older than 2012-11-11 11:42:17');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (71,0,-1,{ts '2013-01-10 11:42:19.230'},N'System',N'Loading content from disk cache...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (72,0,-1,{ts '2013-01-10 11:42:19.443'},N'Custom',N'[UmbracoExamine] Adding examine event handlers for index providers: 3');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (73,0,-1,{ts '2013-01-10 11:42:21.663'},N'System',N'Log scrubbed.  Removed all items older than 2012-11-11 11:42:21');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (74,0,-1,{ts '2013-01-10 11:42:23.580'},N'System',N'Loading content from disk cache...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (75,0,-1,{ts '2013-01-10 11:42:23.660'},N'Custom',N'[UmbracoExamine] Adding examine event handlers for index providers: 3');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (76,0,1067,{ts '2013-01-10 11:42:37.113'},N'Open',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (77,0,1067,{ts '2013-01-10 11:42:46.810'},N'Save',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (78,0,1067,{ts '2013-01-10 11:42:51.020'},N'Save',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (79,0,1067,{ts '2013-01-10 11:42:51.267'},N'Debug',N'Start Before Publish Event for Blog Post 1067');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (80,0,-1,{ts '2013-01-10 11:42:51.537'},N'System',N'Loading content from database...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (81,0,-1,{ts '2013-01-10 11:42:51.550'},N'Debug',N'Republishing starting');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (82,0,-1,{ts '2013-01-10 11:42:51.613'},N'Debug',N'Xml Pages loaded');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (83,0,-1,{ts '2013-01-10 11:42:51.617'},N'Debug',N'Done republishing Xml Index');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (84,0,1067,{ts '2013-01-10 11:42:51.620'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (85,0,-1,{ts '2013-01-10 11:42:51.763'},N'Debug',N'Xml saved in 00:00:00.0156219');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (86,0,-1,{ts '2013-01-10 11:42:51.870'},N'Debug',N'Xml saved in 00:00:00.0329115');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (87,0,1061,{ts '2013-01-10 11:42:52.160'},N'Error',N'Error adding to SiteMapProvider in loadNodes(): System.InvalidOperationException: Multiple nodes with the same URL ''/'' were found. XmlSiteMapProvider requires that sitemap nodes have unique URLs.
   at System.Web.StaticSiteMapProvider.AddNode(SiteMapNode node, SiteMapNode parentNode)
   at umbraco.presentation.nodeFactory.UmbracoSiteMapProvider.loadNodes(String parentId, SiteMapNode parentNode)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (88,0,-1,{ts '2013-01-10 11:42:52.440'},N'Debug',N'Xml saved in 00:00:00.0101066');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (89,0,1069,{ts '2013-01-10 11:43:11.597'},N'Open',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (90,0,1069,{ts '2013-01-10 11:43:16.627'},N'Save',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (91,0,1069,{ts '2013-01-10 11:43:16.967'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (92,0,-1,{ts '2013-01-10 11:43:17.853'},N'Debug',N'Xml saved in 00:00:00.1000836');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (93,0,1071,{ts '2013-01-10 11:43:20.283'},N'Open',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (94,0,1071,{ts '2013-01-10 11:43:26.150'},N'Save',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (95,0,1071,{ts '2013-01-10 11:43:29.247'},N'Save',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (96,0,1071,{ts '2013-01-10 11:43:29.613'},N'Publish',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (97,0,-1,{ts '2013-01-10 11:43:30.707'},N'Debug',N'Xml saved in 00:00:00.0127080');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (98,0,-1,{ts '2013-01-10 11:48:17.877'},N'System',N'Loading content from disk cache...');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (99,0,-1,{ts '2013-01-10 11:48:18.013'},N'Custom',N'[UmbracoExamine] Adding examine event handlers for index providers: 3');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (100,0,-1,{ts '2013-01-10 11:48:37.797'},N'Login',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (101,0,1071,{ts '2013-01-10 11:48:45.043'},N'Open',N'');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (102,0,1071,{ts '2013-01-10 11:48:56.250'},N'Save',N'');
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName]) VALUES (1,N'en-US',N'en-US');
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
SET IDENTITY_INSERT [umbracoDomains] OFF;
GO
SET IDENTITY_INSERT [Comment] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] ON;
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (1,1043,1051,N'umbBlogDatefolder',N'<%@ Master Language="C#" MasterPageFile="~/masterpages/umbMaster.master" AutoEventWireup="true" %>

<asp:Content ContentPlaceHolderID="cp_content" runat="server">
  <div id="content" class="textpage">
    <umbraco:Macro Alias="BlogListPosts" runat="server"></umbraco:Macro>
  </div>
</asp:Content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (2,1044,1051,N'umbBlogpost',N'<%@ master language="C#" masterpagefile="~/masterpages/umbMaster.master" autoeventwireup="true" %>

  
<asp:content contentplaceholderid="cp_top" runat="server">
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.5.5/jquery.validate.min.js"></script>
</asp:content>
  
<asp:content contentplaceholderid="cp_content" runat="server">

<div id="content" class="textpage">
  
<div class="hentry p1 post publish">
<h2 class="entry-title"><umbraco:Item field="pageName" runat="server"></umbraco:Item></h2>

<div class="entry-date">
  <abbr class=''published'' title=''<umbraco:Item field="PostDate" useIfEmpty="createDate" formatAsDate="true" runat="server"/>''>
        <umbraco:Item field="PostDate" useIfEmpty="createDate" formatAsDate="true" runat="server"/>
    </abbr>
</div>

<div class="entry-content">
<umbraco:Item field="bodyText" runat="server"></umbraco:Item>
</div>

<div class="entry-meta">
This entry was written by <span class="author vcard"><spam class="fn n"><umbraco:Item field="writerName" runat="server"/></span></span>,
posted on <abbr class="published" title=''<umbraco:Item ID="Item1" field="PostDate" formatAsDate="true" runat="server"/>''><umbraco:Item field="PostDate" formatAsDate="true" runat="server"/></abbr>

Bookmark the <a href=''<umbraco:Item field="pageID" runat="server" xslt="umbraco.library:NiceUrl({0})"></umbraco:Item>'' title="Permalink" rel="bookmark">permalink</a>.

Follow any comments here with the
<umbraco:Item field="pageID" runat="server" xslt="concat(''&lt;a href=&quot;'',umbraco.library:Replace(umbraco.library:NiceUrl({0}),''.aspx'',''''),''/commentrss.aspx'',''&quot; title=&quot;Comments RSS&quot; rel=&quot;alternate&quot; type=&quot;application/rss+xml&quot;&gt;'',''RSS feed for this post'',''&lt;/a&gt;'')" xsltDisableEscaping="true" ></umbraco:Item>.
    You can <a class="comment-link" href="#respond" title="Post a comment">post a comment</a>.

</div>
  
</div>

<div id="related">
<umbraco:Macro Alias="BlogpostRelatedPages" runat="server"></umbraco:Macro>
</div>

<div id="comments">
<umbraco:Macro Alias="BlogPostListComments" runat="server"></umbraco:Macro>

<div id="respond">
<h3>Post a comment</h3>
<umbraco:Macro CommentsClosedMessage="Sorry, comments are closed" Alias="frmBlogComment" runat="server"></umbraco:Macro>
</div>

</div>

</div>

<div id="subNavigation">
      <umbraco:Macro Alias="umb2ndLevelNavigation" runat="server"></umbraco:Macro>
</div>

</asp:content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (3,1045,NULL,N'CommentRss',N'<%@ Master Language="C#" MasterPageFile="~/umbraco/masterpages/default.master" AutoEventWireup="true" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderDefault" runat="server"><umbraco:Macro iscommentfeed="1" Alias="BlogRss" runat="server"></umbraco:Macro></asp:Content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (4,1046,1051,N'umbBusinessHomepage',N'<%@ Master Language="C#" MasterPageFile="~/masterpages/umbMaster.master" AutoEventWireup="true" %>
<asp:Content ContentPlaceHolderID="cp_content" runat="server">
  <div id="content" class="frontPage">
    <umbraco:Item runat="server" field="bodyText"/>
    
    
    <umbraco:Macro Alias="umbBusinessFrontpageNews" runat="server"></umbraco:Macro>
    
    <umbraco:Macro Alias="umbBusinessFrontpageBlog" runat="server"></umbraco:Macro>
    
    <h3>Business news</h3>
    <umbraco:Macro feedUrl="http://feeds.reuters.com/reuters/technologyNews" numberOfItems="5" excerptLength="120" Alias="umbFeedViewer" runat="server"></umbraco:Macro>
  </div>
</asp:Content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (5,1047,1051,N'umbHomepage',N'<%@ Master Language="C#" MasterPageFile="~/masterpages/umbMaster.master" AutoEventWireup="true" %>
    <asp:Content ContentPlaceHolderID="cp_content" runat="server">
      <div id="content" class="frontPage">
        <umbraco:Item runat="server" field="bodyText"/>
        

      </div>
    </asp:Content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (6,1048,1051,N'umbNews',N'<%@ Master Language="C#" MasterPageFile="~/masterpages/umbMaster.master" AutoEventWireup="true" %>

<asp:Content ContentPlaceHolderID="cp_content" runat="server">

<div id="content" class="textpage">
  
      <div id="contentHeader">  
          <h2><umbraco:Item runat="server" field="pageName"/></h2>
      </div>
      
      <umbraco:Macro Alias="umbNewsListItems" runat="server"></umbraco:Macro>
</div>
   

</asp:Content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (7,1049,1051,N'umbNewsArticle',N'<%@ Master Language="C#" MasterPageFile="~/masterpages/umbMaster.master" AutoEventWireup="true" %>

<asp:Content ContentPlaceHolderID="cp_content" runat="server">

<div id="content" class="textpage">
  
      <div id="contentHeader">  
          <h2><umbraco:Item runat="server" field="pageName"/></h2>
      </div>
        
      <h4><umbraco:Item field="introduction" convertLineBreaks="true" runat="server"></umbraco:Item></h4>
  
      <umbraco:Item runat="server" field="bodyText" />
</div>


</asp:Content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (8,1050,NULL,N'Rss',N'<%@ Master Language="C#" MasterPageFile="~/umbraco/masterpages/default.master" AutoEventWireup="true" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderDefault" runat="server"><umbraco:Macro Alias="BlogRss" runat="server"></umbraco:Macro>
</asp:Content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (9,1051,NULL,N'umbMaster',N'<%@ Master Language="C#" MasterPageFile="~/umbraco/masterpages/default.master" AutoEventWireup="true" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderDefault" runat="server">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"[]> 
<html xmlns="http://www.w3.org/1999/xhtml">
  <head id="head" runat="server">
    
  
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title><asp:placeholder runat="server"><umbraco:Item runat="server" field="pageName" /> - <umbraco:Item runat="server" field="siteName" recursive="true" /></asp:placeholder></title>
    
  <link rel="stylesheet" type="text/css" href="/css/Starterkit.css" /> 
  
  <umbraco:Macro Alias="BlogRssFeedLink" runat="server"></umbraco:Macro>
    
  <asp:contentplaceholder id="cp_head" runat="server" />
</head>
  <body>    
    <div id="main">
      
      <asp:contentplaceholder id="cp_top" runat="server">
        <div id="top">
          <h1 id="siteName"><a href="/"><umbraco:Item runat="server" field="siteName" recursive="true" /></a></h1>
          <h2 id="siteDescription"><umbraco:Item runat="server" field="siteDescription" recursive="true" /></h2>
        
          <umbraco:Macro Alias="umbTopNavigation" runat="server" />
        </div>
      </asp:contentplaceholder>
            
      <div id="body" class="clearfix">
          <form id="RunwayMasterForm" runat="server">
            <asp:ContentPlaceHolder ID="cp_content" runat="server"></asp:ContentPlaceHolder>
          </form>
      </div> 
      
      <asp:contentplaceholder id="cp_footer" runat="server">
        <div id="footer"></div>
      </asp:contentplaceholder>
    </div>
  </body>
</html> 
</asp:content>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[master],[alias],[design]) VALUES (10,1052,1051,N'umbTextpage',N'<%@ Master Language="C#" MasterPageFile="~/masterpages/umbMaster.master" AutoEventWireup="true" %>
<asp:Content ContentPlaceHolderID="cp_content" runat="server">

<div id="content" class="textpage">
  
      <div id="contentHeader">  
          <h2><umbraco:Item runat="server" field="pageName"/></h2>
      </div>
      
      <umbraco:Item runat="server" field="bodyText" />
</div>

<div id="subNavigation">
      <umbraco:Macro Alias="umb2ndLevelNavigation" runat="server"></umbraco:Macro>
</div>
  

</asp:Content>');
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [cmsTaskType] ON;
GO
INSERT INTO [cmsTaskType] ([id],[alias]) VALUES (1,N'toTranslate');
GO
SET IDENTITY_INSERT [cmsTaskType] OFF;
GO
SET IDENTITY_INSERT [cmsTask] OFF;
GO
SET IDENTITY_INSERT [cmsTags] ON;
GO
INSERT INTO [cmsTags] ([id],[tag],[parentId],[group]) VALUES (1,N'umbraco',NULL,N'default');
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
INSERT INTO [cmsTagRelationship] ([nodeId],[tagId]) VALUES (1067,1);
GO
SET IDENTITY_INSERT [cmsTab] ON;
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (3,1032,N'Image',1);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (4,1033,N'File',1);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (5,1031,N'Contents',1);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (6,1053,N'Content',1);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (7,1053,N'Settings',2);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (8,1053,N'Blogroll',3);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (9,1053,N'Spam settings',4);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (10,1053,N'Pings',5);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (11,1054,N'Content',1);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (12,1054,N'Options',2);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (13,1056,N'Site',1);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (14,1056,N'Content',2);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (15,1058,N'Introduction',1);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (16,1058,N'Article',2);
GO
INSERT INTO [cmsTab] ([id],[contenttypeNodeId],[text],[sortorder]) VALUES (17,1059,N'Content',1);
GO
SET IDENTITY_INSERT [cmsTab] OFF;
GO
INSERT INTO [cmsStylesheet] ([nodeId],[filename],[content]) VALUES (1060,N'',N'/*LAYOUT*/

body{text-align: left; padding: 0px; margin: 0px; background: #F6F7F9;}

#main{margin: auto; margin-top: 20px; text-align: left; width: 870px;}

#top{border-bottom: 1px solid #CED7DE;}

#top ul{list-style: none; padding: 0px 0px 15px 0px; margin: 0px;}
#top ul li{display: inline; margin: 0px; padding: 0xp;}
#top ul li a{padding: 10px 20px 10px 0px; color: #000}

#top ul li.current a{font-weight: bold}

#body{margin: auto; padding: 2em 0em 2em 0em;}
#footer{padding-top: 5px; clear: both;}

/* Subpages layout */
#content.textpage{text-align: left; float: left; width: 75%;}
#subNavigation{margin-top: 40px; width: 22%; float: right;} 
#subNavigation ul{list-style: none; border: 1px solid #FFE8CD; background: #FFF9D8; display: block; padding: 10px; padding-left: 0px;}
#subNavigation ul li{margin: 0; padding: 0px; padding-right: 10px;}

/* FONTS standards */
body {font-size: 14px; background:#fff; font-family: "Lucida Grande", Arial, sans-serif;}

h1, h2, h3, h4, h5, h6 {color: #426FC8; font-weight: 500;}
h1 {font-size:60px; line-height: 1; margin-bottom:0.5em; font-weight: bold; letter-spacing: -1px; width: auto; color: #666;}
h2 {font-size:25px; margin-bottom:0.75em;}

h3 {font-size: 18px;line-height:1;margin-bottom:1em;}
h4 {font-size:1.2em;line-height:1.25;margin-bottom:1.25em;}
h5 {font-size:1em;font-weight:bold;margin-bottom:1.5em;}
h6 {font-size:1em;font-weight:bold;}
h1 img, h2 img, h3 img, h4 img, h5 img, h6 img {margin:0;}

p {margin:0 0 1.5em; font-size: 16px;}
p img {float:left;margin:1.5em 1.5em 1.5em 0;padding:0;}
p img.right {float:right;margin:1.5em 0 1.5em 1.5em;}

/* LINKS standards */
a:hover {color:#000;}
a {color: #426FC8; text-decoration:underline;}
h1 a{color: #666; text-decoration: none;}

/* ELEMENTS standards */
blockquote {margin:1.5em;color:#666;font-style:italic;}
strong {font-weight:bold;}
em, dfn {font-style:italic;}
dfn {font-weight:bold;}
sup, sub {line-height:0;}
abbr, acronym {border-bottom:1px dotted #666;}
address {margin:0 0 1.5em;font-style:italic;}
del {color:#666;}
pre, code {margin:1.5em 0;white-space:pre;}
pre, code, tt {font:1em ''andale mono'', ''lucida console'', monospace;line-height:1.5;}
li ul, li ol {margin:0 1.5em;}
ul, ol {margin:0 1.5em 1.5em 1.5em;}
ul {list-style-type:disc;}
ol {list-style-type:decimal;}
dl {margin:0 0 1.5em 0;}
dl dt {font-weight:bold;}
dd {margin-left:1.5em;}
table {margin-bottom:1.4em;width:100%;}
th {font-weight:bold;background:#C3D9FF;}
th, td {padding:4px 10px 4px 5px;}
tr.even td {background:#E5ECF9;}
tfoot {font-style:italic;}
caption {background:#eee;}

/* FORM ELEMENTS */
label {font-weight:bold;}
fieldset {padding:1.4em;margin:0 0 1.5em 0;border:1px solid #ccc;}
legend {font-weight:bold;font-size:1.2em;}
input.text, input.title, textarea, select {margin:0.5em 0;border:1px solid #bbb;}
input.text:focus, input.title:focus, textarea:focus, select:focus {border:1px solid #666;}
input.text, input.title {width:300px;padding:5px;}
input.title {font-size:1.5em;}
textarea {width:300px;height:250px;padding:5px;}
.error, .notice, .success {padding:.8em;margin-bottom:1em;border:2px solid #ddd;}
.error {background:#FBE3E4;color:#8a1f11;border-color:#FBC2C4;}
.notice {background:#FFF6BF;color:#514721;border-color:#FFD324;}
.success {background:#E6EFC2;color:#264409;border-color:#C6D880;}
.error a {color:#8a1f11;}
.notice a {color:#514721;}
.success a {color:#264409;}

.error ul{margin-bottom: 0; padding-bottom: 0;}


/*BLOG STYLES */
#content .post{text-align: left;}

/* Clear fix to repleace br clear:both */ 
.clearfix:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
 
.clearfix {
  display: inline-block;
}
 
html[xmlns] .clearfix {
  display: block;
}
 
* html .clearfix {
  height: 1%;
}



















































');
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (6,-90,1032,3,N'umbracoFile',N'Upload image',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (7,-92,1032,3,N'umbracoWidth',N'Width',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (8,-92,1032,3,N'umbracoHeight',N'Height',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (9,-92,1032,3,N'umbracoBytes',N'Size',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (10,-92,1032,3,N'umbracoExtension',N'Type',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (24,-90,1033,4,N'umbracoFile',N'Upload file',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (25,-92,1033,4,N'umbracoExtension',N'Type',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (26,-92,1033,4,N'umbracoBytes',N'Size',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (27,-38,1031,5,N'contents',N'Contents:',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (28,-88,1053,7,N'siteName',N'Site name',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (29,-89,1053,7,N'siteDescription',N'Site description',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (30,1040,1053,8,N'blogroll',N'Blogroll',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (31,-88,1053,9,N'akismetAPIKey',N'Akismet API Key',NULL,0,0,N'',N'Enter a valid WP.com API key(http://en.wordpress.com/api-keys/) and your blog will be protected from spam by using the Akismet anti-spam service.');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (32,1042,1053,NULL,N'owner',N'Owner',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (33,1040,1053,10,N'pingServices',N'Services to ping',NULL,0,0,N'',N'Automatically notify blog directories and search engines that your blog has been updated');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (34,-87,1053,6,N'bodyText',N'Body text',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (35,-87,1054,11,N'bodyText',N'Content',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (36,1041,1054,11,N'tags',N'Tags',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (37,-49,1054,12,N'closeComments',N'Close comments',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (38,-41,1054,NULL,N'PostDate',N'Post Date',NULL,0,1,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (39,-49,1055,NULL,N'umbracoNaviHide',N'Hide from navigation',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (40,-87,1056,14,N'bodyText',N'Body text',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (41,-88,1056,13,N'siteName',N'Site Name',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (42,-89,1056,13,N'siteDescription',N'Site Description',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (43,-89,1058,15,N'introduction',N'Introduction',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (44,-87,1058,16,N'bodyText',N'Body',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (45,-87,1059,17,N'bodyText',N'Body Text',NULL,0,0,N'',N'');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[tabId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (46,-49,1059,NULL,N'umbracoNaviHide',N'Hide in navigation',NULL,0,0,N'',N'');
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyData] ON;
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (1,1061,'3c22a413-d136-4d21-be8b-8a0d3d6b80db',40,NULL,NULL,NULL,N'<p>The Simple Starter Kit gives you a bare-bones website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>The Simple website is very basic in form and provided without any design or functionality - unless you add a Skin, of course. By installing the Simple Starter Kit, you''ll begin with a minimal site built on best practices. You''ll also enjoy the benefits of speaking the same "language" as the rest of the Umbraco community by using common properties and naming conventions.</p>
<p>Now that you know what the Simple site is, it is time to get started using Umbraco.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (2,1061,'3c22a413-d136-4d21-be8b-8a0d3d6b80db',41,NULL,NULL,N'Business site',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (3,1061,'3c22a413-d136-4d21-be8b-8a0d3d6b80db',42,NULL,NULL,NULL,N'Off to a great start');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (4,1063,'03bb0418-3581-4bcd-a5d2-0fe5b58b8244',43,NULL,NULL,NULL,N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id enim vel metus dignissim fermentum. Donec molestie pulvinar ultricies. Donec ullamcorper facilisis mattis. Sed id condimentum dui. Vivamus ornare congue facilisis. Nulla arcu lorem, sollicitudin at tincidunt nec, congue in dolor. Morbi mattis magna non risus convallis non dignissim sapien dictum.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (5,1063,'03bb0418-3581-4bcd-a5d2-0fe5b58b8244',44,NULL,NULL,NULL,N'
<p>Nam consectetur risus quis diam dignissim convallis. Donec
congue arcu at ligula venenatis facilisis. Donec tincidunt, augue
vel venenatis suscipit, ipsum orci pretium lacus, et tempor felis
nisi eu diam. Fusce vel turpis quis nisl viverra pharetra sit amet
et risus. Donec interdum ullamcorper sodales. Mauris feugiat velit
rhoncus sapien sagittis venenatis quis non purus. Cras ac arcu
velit.</p>

<p>Class aptent taciti sociosqu ad litora torquent per conubia
nostra, per inceptos himenaeos. Etiam non tortor nec risus laoreet
auctor. Mauris ipsum ligula, suscipit fermentum interdum id,
facilisis eu felis. Proin ut porttitor tortor. Proin quis pulvinar
urna. Nullam cursus feugiat feugiat. Praesent iaculis lacus at arcu
feugiat suscipit. Proin elementum tortor vitae massa euismod
tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut
ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue
magna, sodales eu consectetur vestibulum, consequat in libero.
Nulla facilisi. Nunc id ligula urna. Sed tempus bibendum eros, a
posuere ante varius eu. Mauris quis neque nec felis laoreet
eleifend. Nullam bibendum molestie bibendum. Aenean vestibulum
sodales orci sed mollis.</p>

<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>
');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (6,1064,'5336d895-f777-4a87-9a2a-69526d4f7906',43,NULL,NULL,NULL,N'Tortor vitae massa euismod tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue magna, sodales eu consectetur vestibulum, consequat in libero. Nulla facilisi. Nunc id ligula urna.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (7,1064,'5336d895-f777-4a87-9a2a-69526d4f7906',44,NULL,NULL,NULL,N'
<p>Class aptent taciti sociosqu ad litora torquent per conubia
nostra, per inceptos himenaeos. Etiam non tortor nec risus laoreet
auctor. Mauris ipsum ligula, suscipit fermentum interdum id,
facilisis eu felis. Proin ut porttitor tortor. Proin quis pulvinar
urna. Nullam cursus feugiat feugiat. Praesent iaculis lacus at arcu
feugiat suscipit. Proin elementum tortor vitae massa euismod
tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut
ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue
magna, sodales eu consectetur vestibulum, consequat in libero.
Nulla facilisi. Nunc id ligula urna. Sed tempus bibendum eros, a
posuere ante varius eu. Mauris quis neque nec felis laoreet
eleifend. Nullam bibendum molestie bibendum. Aenean vestibulum
sodales orci sed mollis.</p>

<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque
urna sodales quis rutrum sapien consectetur. Nam consectetur semper
augue sit amet fringilla. Curabitur vel magna rhoncus ipsum
pharetra aliquet. Morbi et molestie justo. Fusce congue tellus
aliquam leo sollicitudin nec bibendum sapien egestas. Pellentesque
nec sapien enim. Phasellus justo leo, congue dapibus euismod id,
luctus ut ante. Curabitur justo metus, faucibus eget placerat sit
amet, fringilla eget urna. Aliquam a leo ipsum.</p>
');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (8,1065,'31355ff7-b966-445a-9597-d0c3a0a7d39a',43,NULL,NULL,NULL,N'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque urna sodales quis rutrum sapien consectetur. Nam consectetur semper augue sit amet fringilla. Curabitur vel magna rhoncus ipsum pharetra aliquet.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (9,1065,'31355ff7-b966-445a-9597-d0c3a0a7d39a',44,NULL,NULL,NULL,N'
<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque
urna sodales quis rutrum sapien consectetur. Nam consectetur semper
augue sit amet fringilla. Curabitur vel magna rhoncus ipsum
pharetra aliquet. Morbi et molestie justo. Fusce congue tellus
aliquam leo sollicitudin nec bibendum sapien egestas. Pellentesque
nec sapien enim. Phasellus justo leo, congue dapibus euismod id,
luctus ut ante. Curabitur justo metus, faucibus eget placerat sit
amet, fringilla eget urna. Aliquam a leo ipsum.</p>

<p>In nec tristique odio. Proin fringilla lobortis neque sit amet
dapibus. Maecenas mollis tempor lacus, ac commodo sem condimentum
ac. Nulla facilisi. Duis eleifend placerat laoreet. In fringilla
accumsan leo a laoreet. Sed tincidunt nisl a risus blandit
pellentesque. Mauris in ante ac sapien semper sagittis. Etiam
luctus posuere pulvinar. Sed eros sem, sollicitudin a laoreet non,
ultrices nec nulla. Morbi tempus, nunc ac malesuada tempus, ipsum
neque sodales ipsum, et lacinia libero tellus a risus. Integer sit
amet purus nibh, in aliquam nisi. Curabitur non imperdiet libero.
Quisque magna massa, vestibulum vitae laoreet sit amet, luctus eu
elit. Nam eros mi, consectetur a eleifend sed, tincidunt id
odio.</p>
');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (10,1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',28,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (11,1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',29,NULL,NULL,NULL,N' ');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (12,1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',30,NULL,NULL,NULL,N'<links />');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (13,1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',31,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (14,1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',32,NULL,NULL,NULL,N'0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (15,1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',33,NULL,NULL,NULL,N'<links />');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (16,1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',34,NULL,NULL,NULL,N'<?UMBRACO_MACRO macroAlias="BlogListPosts" />');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (17,1067,'e26c0321-36aa-4f73-9da4-507be689a5ef',35,NULL,NULL,NULL,N'
<p><strong>Hi there!</strong> , welcome to your new Umbraco powered
blog. Before you start posting away, there''s a handful of things we
thought you should know:</p>

<ol>
<li>
<p>There is a comprehensive and detailed usage and configuration
manual, which covers everything about setting up this blog and
about blogging in general</p>

<p><strong><a
href="http://our.umbraco.org/FileDownload?id=498">Download the
usage guide</a></strong></p>
</li>

<li>
<p>This package is open source and developement is community
driven. So if you have an idea for improvement or wish to be a part
of developing this package you should join the conversaion.</p>

<p><a
href="http://our.umbraco.org/projects/blog-4-umbraco"><strong>Go to
the Blog 4 Umbraco project page on our.umbraco.org</strong></a></p>
</li>

<li>
<p>You can change the appearance of this blog by changing the skin
in the umbraco back-end. The skins are powered by the umbraco
community. If you wish to do your own skin or just want to tweak
the current one, you can find guidance in the skinners guide</p>

<p><strong><a
href="http://our.umbraco.org/FileDownload?id=498">Download the
skinners manual</a></strong></p>
</li>

<li>
<p>Chainging the skin is just the first step, everything is
extendable and hackable. This blog uses open standards and follows
umbraco best practices, so everything can be tweaked. Want to know
how to get started? Ask the friendly community at
our.umbraco.org</p>

<p><strong><a href="http://our.umbraco.org">Go to our.umbraco.org
community</a></strong></p>
</li>
</ol>
');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (18,1067,'e26c0321-36aa-4f73-9da4-507be689a5ef',36,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (19,1067,'e26c0321-36aa-4f73-9da4-507be689a5ef',37,1,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (20,1067,'e26c0321-36aa-4f73-9da4-507be689a5ef',38,NULL,{ts '2010-09-07 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (21,1068,'9b801305-ca0a-4189-b94b-34a7779502a3',45,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (22,1068,'9b801305-ca0a-4189-b94b-34a7779502a3',46,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (23,1069,'6a883056-4255-4906-8c01-632ee8611f31',45,NULL,NULL,NULL,N'<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.<br /> Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (24,1069,'6a883056-4255-4906-8c01-632ee8611f31',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (25,1070,'0d61300e-b50f-41c8-b02d-63e829414452',45,NULL,NULL,NULL,N'<p>The Simple Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Simple Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Simple site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with XSLT and Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with xslt">Microsoft''s xslt</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (26,1070,'0d61300e-b50f-41c8-b02d-63e829414452',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (27,1071,'830eb25d-3a1a-4446-b270-1dc8798d46b5',45,NULL,NULL,NULL,N'<p>You''ve installed Umbraco and the basic Simple website.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Simple site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.org" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, either by editing the CSS styles and HTML templates or by selecting and applying a Skin. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as automated navigation. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (28,1071,'830eb25d-3a1a-4446-b270-1dc8798d46b5',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (29,1072,'319462aa-9729-42e3-b819-b4cc2885657a',45,NULL,NULL,NULL,N'<h3>Office address</h3>
<p>Company Name<br />Streetname 3432<br />DK-9872 City Name</p>
<p>Country</p>
<p><strong>Phone</strong>: +45 3728-282-829</p>
<p><strong>Fax</strong>:  +45 3728-282-829</p>
<p> </p>
<h3>Send us an email</h3>
<p>This contact form sends email to the addresse configured on the macro itself, edit the page in umbraco to change the addresse</p>
<p>Also ensure that your smtp email settings are correct, these are set in the <strong>web.config </strong>file located in the root of your website.</p>
<?UMBRACO_MACRO subject="Email from your website" youremail="name@domain.com" macroAlias="RunwayContactForm" />');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (30,1072,'319462aa-9729-42e3-b819-b4cc2885657a',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (31,1061,'693896e8-8ac8-4b4a-86b2-c6f2c26cd6cc',40,NULL,NULL,NULL,N'<p>The Simple Starter Kit gives you a bare-bones website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>The Simple website is very basic in form and provided without any design or functionality - unless you add a Skin, of course. By installing the Simple Starter Kit, you''ll begin with a minimal site built on best practices. You''ll also enjoy the benefits of speaking the same "language" as the rest of the Umbraco community by using common properties and naming conventions.</p>
<p>Now that you know what the Simple site is, it is time to get started using Umbraco.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (32,1061,'693896e8-8ac8-4b4a-86b2-c6f2c26cd6cc',41,NULL,NULL,N'Business site',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (33,1061,'693896e8-8ac8-4b4a-86b2-c6f2c26cd6cc',42,NULL,NULL,NULL,N'Off to a great start');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (34,1063,'f654cd46-1da6-4518-a6c3-59da72fa85ac',43,NULL,NULL,NULL,N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id enim vel metus dignissim fermentum. Donec molestie pulvinar ultricies. Donec ullamcorper facilisis mattis. Sed id condimentum dui. Vivamus ornare congue facilisis. Nulla arcu lorem, sollicitudin at tincidunt nec, congue in dolor. Morbi mattis magna non risus convallis non dignissim sapien dictum.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (35,1063,'f654cd46-1da6-4518-a6c3-59da72fa85ac',44,NULL,NULL,NULL,N'
<p>Nam consectetur risus quis diam dignissim convallis. Donec
congue arcu at ligula venenatis facilisis. Donec tincidunt, augue
vel venenatis suscipit, ipsum orci pretium lacus, et tempor felis
nisi eu diam. Fusce vel turpis quis nisl viverra pharetra sit amet
et risus. Donec interdum ullamcorper sodales. Mauris feugiat velit
rhoncus sapien sagittis venenatis quis non purus. Cras ac arcu
velit.</p>

<p>Class aptent taciti sociosqu ad litora torquent per conubia
nostra, per inceptos himenaeos. Etiam non tortor nec risus laoreet
auctor. Mauris ipsum ligula, suscipit fermentum interdum id,
facilisis eu felis. Proin ut porttitor tortor. Proin quis pulvinar
urna. Nullam cursus feugiat feugiat. Praesent iaculis lacus at arcu
feugiat suscipit. Proin elementum tortor vitae massa euismod
tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut
ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue
magna, sodales eu consectetur vestibulum, consequat in libero.
Nulla facilisi. Nunc id ligula urna. Sed tempus bibendum eros, a
posuere ante varius eu. Mauris quis neque nec felis laoreet
eleifend. Nullam bibendum molestie bibendum. Aenean vestibulum
sodales orci sed mollis.</p>

<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>
');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (36,1064,'7a2895d3-b745-45ee-978b-d5da2e280ee0',43,NULL,NULL,NULL,N'Tortor vitae massa euismod tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue magna, sodales eu consectetur vestibulum, consequat in libero. Nulla facilisi. Nunc id ligula urna.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (37,1064,'7a2895d3-b745-45ee-978b-d5da2e280ee0',44,NULL,NULL,NULL,N'
<p>Class aptent taciti sociosqu ad litora torquent per conubia
nostra, per inceptos himenaeos. Etiam non tortor nec risus laoreet
auctor. Mauris ipsum ligula, suscipit fermentum interdum id,
facilisis eu felis. Proin ut porttitor tortor. Proin quis pulvinar
urna. Nullam cursus feugiat feugiat. Praesent iaculis lacus at arcu
feugiat suscipit. Proin elementum tortor vitae massa euismod
tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut
ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue
magna, sodales eu consectetur vestibulum, consequat in libero.
Nulla facilisi. Nunc id ligula urna. Sed tempus bibendum eros, a
posuere ante varius eu. Mauris quis neque nec felis laoreet
eleifend. Nullam bibendum molestie bibendum. Aenean vestibulum
sodales orci sed mollis.</p>

<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque
urna sodales quis rutrum sapien consectetur. Nam consectetur semper
augue sit amet fringilla. Curabitur vel magna rhoncus ipsum
pharetra aliquet. Morbi et molestie justo. Fusce congue tellus
aliquam leo sollicitudin nec bibendum sapien egestas. Pellentesque
nec sapien enim. Phasellus justo leo, congue dapibus euismod id,
luctus ut ante. Curabitur justo metus, faucibus eget placerat sit
amet, fringilla eget urna. Aliquam a leo ipsum.</p>
');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (38,1065,'3d92dbd3-9288-4587-845b-52a9f1d8b8c4',43,NULL,NULL,NULL,N'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque urna sodales quis rutrum sapien consectetur. Nam consectetur semper augue sit amet fringilla. Curabitur vel magna rhoncus ipsum pharetra aliquet.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (39,1065,'3d92dbd3-9288-4587-845b-52a9f1d8b8c4',44,NULL,NULL,NULL,N'
<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque
urna sodales quis rutrum sapien consectetur. Nam consectetur semper
augue sit amet fringilla. Curabitur vel magna rhoncus ipsum
pharetra aliquet. Morbi et molestie justo. Fusce congue tellus
aliquam leo sollicitudin nec bibendum sapien egestas. Pellentesque
nec sapien enim. Phasellus justo leo, congue dapibus euismod id,
luctus ut ante. Curabitur justo metus, faucibus eget placerat sit
amet, fringilla eget urna. Aliquam a leo ipsum.</p>

<p>In nec tristique odio. Proin fringilla lobortis neque sit amet
dapibus. Maecenas mollis tempor lacus, ac commodo sem condimentum
ac. Nulla facilisi. Duis eleifend placerat laoreet. In fringilla
accumsan leo a laoreet. Sed tincidunt nisl a risus blandit
pellentesque. Mauris in ante ac sapien semper sagittis. Etiam
luctus posuere pulvinar. Sed eros sem, sollicitudin a laoreet non,
ultrices nec nulla. Morbi tempus, nunc ac malesuada tempus, ipsum
neque sodales ipsum, et lacinia libero tellus a risus. Integer sit
amet purus nibh, in aliquam nisi. Curabitur non imperdiet libero.
Quisque magna massa, vestibulum vitae laoreet sit amet, luctus eu
elit. Nam eros mi, consectetur a eleifend sed, tincidunt id
odio.</p>
');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (40,1066,'0042e7a7-e6e5-4677-a6e3-87c379d70915',28,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (41,1066,'0042e7a7-e6e5-4677-a6e3-87c379d70915',29,NULL,NULL,NULL,N' ');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (42,1066,'0042e7a7-e6e5-4677-a6e3-87c379d70915',30,NULL,NULL,NULL,N'<links />');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (43,1066,'0042e7a7-e6e5-4677-a6e3-87c379d70915',31,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (44,1066,'0042e7a7-e6e5-4677-a6e3-87c379d70915',32,NULL,NULL,NULL,N'0');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (45,1066,'0042e7a7-e6e5-4677-a6e3-87c379d70915',33,NULL,NULL,NULL,N'<links />');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (46,1066,'0042e7a7-e6e5-4677-a6e3-87c379d70915',34,NULL,NULL,NULL,N'<?UMBRACO_MACRO macroAlias="BlogListPosts" />');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (47,1067,'0b15b251-d723-4c6a-8957-c99c8d9529eb',35,NULL,NULL,NULL,N'<p><strong>Hi there!</strong> , welcome to your new Umbraco powered blog. Before you start posting away, there''s a handful of things we thought you should know:</p>
<ol>
<li>
<p>There is a comprehensive and detailed usage and configuration manual, which covers everything about setting up this blog and about blogging in general</p>
<p><strong><a href="http://our.umbraco.org/FileDownload?id=498">Download the usage guide</a></strong></p>
</li>
<li>
<p>This package is open source and developement is community driven. So if you have an idea for improvement or wish to be a part of developing this package you should join the conversaion.</p>
<p><a href="http://our.umbraco.org/projects/blog-4-umbraco"><strong>Go to the Blog 4 Umbraco project page on our.umbraco.org</strong></a></p>
</li>
<li>
<p>You can change the appearance of this blog by changing the skin in the umbraco back-end. The skins are powered by the umbraco community. If you wish to do your own skin or just want to tweak the current one, you can find guidance in the skinners guide</p>
<p><strong><a href="http://our.umbraco.org/FileDownload?id=498">Download the skinners manual</a></strong></p>
</li>
<li>
<p>Chainging the skin is just the first step, everything is extendable and hackable. This blog uses open standards and follows umbraco best practices, so everything can be tweaked. Want to know how to get started? Ask the friendly community at our.umbraco.org</p>
<p><strong><a href="http://our.umbraco.org">Go to our.umbraco.org community</a></strong></p>
</li>
</ol>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (48,1067,'0b15b251-d723-4c6a-8957-c99c8d9529eb',36,NULL,NULL,NULL,N'umbraco');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (49,1067,'0b15b251-d723-4c6a-8957-c99c8d9529eb',37,1,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (50,1067,'0b15b251-d723-4c6a-8957-c99c8d9529eb',38,NULL,{ts '2010-09-07 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (51,1068,'9ac46958-dc02-4c23-9632-dc862505a91e',45,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (52,1068,'9ac46958-dc02-4c23-9632-dc862505a91e',46,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (53,1069,'fa45e37d-bde7-43fa-bbc0-04277d3f733c',45,NULL,NULL,NULL,N'<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.<br /> Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way...</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (54,1069,'fa45e37d-bde7-43fa-bbc0-04277d3f733c',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (55,1070,'381ecc59-1574-4b8e-8528-8454b3b808b0',45,NULL,NULL,NULL,N'<p>The Simple Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Simple Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Simple site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with XSLT and Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with xslt">Microsoft''s xslt</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (56,1070,'381ecc59-1574-4b8e-8528-8454b3b808b0',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (57,1071,'065633ab-e616-4950-bffe-46d64abcd8b4',45,NULL,NULL,NULL,N'<p>You''ve installed Umbraco and the basic Simple website.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Simple site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.org" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, either by editing the CSS styles and HTML templates or by selecting and applying a Skin. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as automated navigation. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.!</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (58,1071,'065633ab-e616-4950-bffe-46d64abcd8b4',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (59,1072,'1ea853c4-8e42-40ad-b2f7-12a7952fd6d0',45,NULL,NULL,NULL,N'<h3>Office address</h3>
<p>Company Name<br />Streetname 3432<br />DK-9872 City Name</p>
<p>Country</p>
<p><strong>Phone</strong>: +45 3728-282-829</p>
<p><strong>Fax</strong>:  +45 3728-282-829</p>
<p> </p>
<h3>Send us an email</h3>
<p>This contact form sends email to the addresse configured on the macro itself, edit the page in umbraco to change the addresse</p>
<p>Also ensure that your smtp email settings are correct, these are set in the <strong>web.config </strong>file located in the root of your website.</p>
<?UMBRACO_MACRO subject="Email from your website" youremail="name@domain.com" macroAlias="RunwayContactForm" />');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (60,1072,'1ea853c4-8e42-40ad-b2f7-12a7952fd6d0',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (61,1067,'e3990769-396e-41a5-9c42-029bbabcc175',35,NULL,NULL,NULL,N'<p><strong>Hi there!</strong> , welcome to your new Umbraco powered blog. Before you start posting away, there''s a handful of things we thought you should know:</p>
<ol>
<li>
<p>There is a comprehensive and detailed usage and configuration manual, which covers everything about setting up this blog and about blogging in general</p>
<p><strong><a href="http://our.umbraco.org/FileDownload?id=498">Download the usage guide</a></strong></p>
</li>
<li>
<p>This package is open source and developement is community driven. So if you have an idea for improvement or wish to be a part of developing this package you should join the conversaion.</p>
<p><a href="http://our.umbraco.org/projects/blog-4-umbraco"><strong>Go to the Blog 4 Umbraco project page on our.umbraco.org</strong></a></p>
</li>
<li>
<p>You can change the appearance of this blog by changing the skin in the umbraco back-end. The skins are powered by the umbraco community. If you wish to do your own skin or just want to tweak the current one, you can find guidance in the skinners guide</p>
<p><strong><a href="http://our.umbraco.org/FileDownload?id=498">Download the skinners manual</a></strong></p>
</li>
<li>
<p>Chainging the skin is just the first step, everything is extendable and hackable. This blog uses open standards and follows umbraco best practices, so everything can be tweaked. Want to know how to get started? Ask the friendly community at our.umbraco.org</p>
<p><strong><a href="http://our.umbraco.org">Go to our.umbraco.org community</a></strong></p>
</li>
</ol>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (62,1067,'e3990769-396e-41a5-9c42-029bbabcc175',36,NULL,NULL,NULL,N'umbraco');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (63,1067,'e3990769-396e-41a5-9c42-029bbabcc175',37,1,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (64,1067,'e3990769-396e-41a5-9c42-029bbabcc175',38,NULL,{ts '2010-09-07 00:00:00.000'},NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (65,1069,'ccd7b4d8-7c9f-48bd-a07e-ce88ff6a6777',45,NULL,NULL,NULL,N'<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.<br /> Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way...</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (66,1069,'ccd7b4d8-7c9f-48bd-a07e-ce88ff6a6777',46,0,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (67,1071,'e1350e35-663c-4273-b9e2-acc1c30ef15e',45,NULL,NULL,NULL,N'<p><strong>You''ve installed Umbraco and the basic Simple website.</strong></p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Simple site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.org" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, either by editing the CSS styles and HTML templates or by selecting and applying a Skin. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as automated navigation. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.!</p>');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDate],[dataNvarchar],[dataNtext]) VALUES (68,1071,'e1350e35-663c-4273-b9e2-acc1c30ef15e',46,0,NULL,NULL,NULL);
GO
SET IDENTITY_INSERT [cmsPropertyData] OFF;
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1061,'3c22a413-d136-4d21-be8b-8a0d3d6b80db',{ts '2013-01-10 11:40:51.200'},N'<umbHomepage id="1061" parentID="-1" level="1" writerID="0" creatorID="0" nodeType="1056" template="1046" sortOrder="0" createDate="2010-09-07T13:19:39" updateDate="2013-01-10T11:40:51" nodeName="Business Site" urlName="business-site" writerName="admin" creatorName="admin" path="-1,1061" isDoc=""><bodyText><![CDATA[<p>The Simple Starter Kit gives you a bare-bones website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>The Simple website is very basic in form and provided without any design or functionality - unless you add a Skin, of course. By installing the Simple Starter Kit, you''ll begin with a minimal site built on best practices. You''ll also enjoy the benefits of speaking the same "language" as the rest of the Umbraco community by using common properties and naming conventions.</p>
<p>Now that you know what the Simple site is, it is time to get started using Umbraco.</p>]]></bodyText><siteName>Business site</siteName><siteDescription><![CDATA[Off to a great start]]></siteDescription></umbHomepage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1062,'3943e8dd-4f26-4807-9c8a-0e67b7994ad4',{ts '2013-01-10 11:40:51.257'},N'<umbNewsArea id="1062" parentID="1061" level="2" writerID="0" creatorID="0" nodeType="1057" template="1048" sortOrder="0" createDate="2010-09-07T13:22:05" updateDate="2013-01-10T11:40:51" nodeName="Company News" urlName="company-news" writerName="admin" creatorName="admin" path="-1,1061,1062" isDoc="" />');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1063,'03bb0418-3581-4bcd-a5d2-0fe5b58b8244',{ts '2013-01-10 11:40:51.327'},N'<umbNewsArticle id="1063" parentID="1062" level="3" writerID="0" creatorID="0" nodeType="1058" template="1049" sortOrder="0" createDate="2010-09-07T13:22:21" updateDate="2013-01-10T11:40:51" nodeName="Another record year" urlName="another-record-year" writerName="admin" creatorName="admin" path="-1,1061,1062,1063" isDoc=""><introduction><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id enim vel metus dignissim fermentum. Donec molestie pulvinar ultricies. Donec ullamcorper facilisis mattis. Sed id condimentum dui. Vivamus ornare congue facilisis. Nulla arcu lorem, sollicitudin at tincidunt nec, congue in dolor. Morbi mattis magna non risus convallis non dignissim sapien dictum.]]></introduction><bodyText><![CDATA[
<p>Nam consectetur risus quis diam dignissim convallis. Donec
congue arcu at ligula venenatis facilisis. Donec tincidunt, augue
vel venenatis suscipit, ipsum orci pretium lacus, et tempor felis
nisi eu diam. Fusce vel turpis quis nisl viverra pharetra sit amet
et risus. Donec interdum ullamcorper sodales. Mauris feugiat velit
rhoncus sapien sagittis venenatis quis non purus. Cras ac arcu
velit.</p>

<p>Class aptent taciti sociosqu ad litora torquent per conubia
nostra, per inceptos himenaeos. Etiam non tortor nec risus laoreet
auctor. Mauris ipsum ligula, suscipit fermentum interdum id,
facilisis eu felis. Proin ut porttitor tortor. Proin quis pulvinar
urna. Nullam cursus feugiat feugiat. Praesent iaculis lacus at arcu
feugiat suscipit. Proin elementum tortor vitae massa euismod
tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut
ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue
magna, sodales eu consectetur vestibulum, consequat in libero.
Nulla facilisi. Nunc id ligula urna. Sed tempus bibendum eros, a
posuere ante varius eu. Mauris quis neque nec felis laoreet
eleifend. Nullam bibendum molestie bibendum. Aenean vestibulum
sodales orci sed mollis.</p>

<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>
]]></bodyText></umbNewsArticle>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1064,'5336d895-f777-4a87-9a2a-69526d4f7906',{ts '2013-01-10 11:40:51.397'},N'<umbNewsArticle id="1064" parentID="1062" level="3" writerID="0" creatorID="0" nodeType="1058" template="1049" sortOrder="1" createDate="2010-09-07T13:22:35" updateDate="2013-01-10T11:40:51" nodeName="Finance department news" urlName="finance-department-news" writerName="admin" creatorName="admin" path="-1,1061,1062,1064" isDoc=""><introduction><![CDATA[Tortor vitae massa euismod tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue magna, sodales eu consectetur vestibulum, consequat in libero. Nulla facilisi. Nunc id ligula urna.]]></introduction><bodyText><![CDATA[
<p>Class aptent taciti sociosqu ad litora torquent per conubia
nostra, per inceptos himenaeos. Etiam non tortor nec risus laoreet
auctor. Mauris ipsum ligula, suscipit fermentum interdum id,
facilisis eu felis. Proin ut porttitor tortor. Proin quis pulvinar
urna. Nullam cursus feugiat feugiat. Praesent iaculis lacus at arcu
feugiat suscipit. Proin elementum tortor vitae massa euismod
tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut
ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue
magna, sodales eu consectetur vestibulum, consequat in libero.
Nulla facilisi. Nunc id ligula urna. Sed tempus bibendum eros, a
posuere ante varius eu. Mauris quis neque nec felis laoreet
eleifend. Nullam bibendum molestie bibendum. Aenean vestibulum
sodales orci sed mollis.</p>

<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque
urna sodales quis rutrum sapien consectetur. Nam consectetur semper
augue sit amet fringilla. Curabitur vel magna rhoncus ipsum
pharetra aliquet. Morbi et molestie justo. Fusce congue tellus
aliquam leo sollicitudin nec bibendum sapien egestas. Pellentesque
nec sapien enim. Phasellus justo leo, congue dapibus euismod id,
luctus ut ante. Curabitur justo metus, faucibus eget placerat sit
amet, fringilla eget urna. Aliquam a leo ipsum.</p>
]]></bodyText></umbNewsArticle>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1065,'31355ff7-b966-445a-9597-d0c3a0a7d39a',{ts '2013-01-10 11:40:51.540'},N'<umbNewsArticle id="1065" parentID="1062" level="3" writerID="0" creatorID="0" nodeType="1058" template="1049" sortOrder="2" createDate="2010-09-07T13:22:53" updateDate="2013-01-10T11:40:51" nodeName="Stocks are up" urlName="stocks-are-up" writerName="admin" creatorName="admin" path="-1,1061,1062,1065" isDoc=""><introduction><![CDATA[Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque urna sodales quis rutrum sapien consectetur. Nam consectetur semper augue sit amet fringilla. Curabitur vel magna rhoncus ipsum pharetra aliquet.]]></introduction><bodyText><![CDATA[
<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque
urna sodales quis rutrum sapien consectetur. Nam consectetur semper
augue sit amet fringilla. Curabitur vel magna rhoncus ipsum
pharetra aliquet. Morbi et molestie justo. Fusce congue tellus
aliquam leo sollicitudin nec bibendum sapien egestas. Pellentesque
nec sapien enim. Phasellus justo leo, congue dapibus euismod id,
luctus ut ante. Curabitur justo metus, faucibus eget placerat sit
amet, fringilla eget urna. Aliquam a leo ipsum.</p>

<p>In nec tristique odio. Proin fringilla lobortis neque sit amet
dapibus. Maecenas mollis tempor lacus, ac commodo sem condimentum
ac. Nulla facilisi. Duis eleifend placerat laoreet. In fringilla
accumsan leo a laoreet. Sed tincidunt nisl a risus blandit
pellentesque. Mauris in ante ac sapien semper sagittis. Etiam
luctus posuere pulvinar. Sed eros sem, sollicitudin a laoreet non,
ultrices nec nulla. Morbi tempus, nunc ac malesuada tempus, ipsum
neque sodales ipsum, et lacinia libero tellus a risus. Integer sit
amet purus nibh, in aliquam nisi. Curabitur non imperdiet libero.
Quisque magna massa, vestibulum vitae laoreet sit amet, luctus eu
elit. Nam eros mi, consectetur a eleifend sed, tincidunt id
odio.</p>
]]></bodyText></umbNewsArticle>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',{ts '2013-01-10 11:40:51.850'},N'<umbBlog id="1066" parentID="1061" level="2" writerID="0" creatorID="0" nodeType="1053" template="1047" sortOrder="1" createDate="2010-09-07T13:26:10" updateDate="2013-01-10T11:40:51" nodeName="Company Blog" urlName="company-blog" writerName="admin" creatorName="admin" path="-1,1061,1066" isDoc=""><siteName></siteName><siteDescription><![CDATA[ ]]></siteDescription><blogroll><links /></blogroll><akismetAPIKey></akismetAPIKey><owner><![CDATA[0]]></owner><pingServices><links /></pingServices><bodyText><![CDATA[<?UMBRACO_MACRO macroAlias="BlogListPosts" />]]></bodyText></umbBlog>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1067,'e26c0321-36aa-4f73-9da4-507be689a5ef',{ts '2013-01-10 11:40:52.143'},N'<umbBlogPost id="1067" parentID="1066" level="3" writerID="0" creatorID="0" nodeType="1054" template="1044" sortOrder="0" createDate="2010-09-07T13:31:05" updateDate="2013-01-10T11:40:51" nodeName="Company blog post" urlName="company-blog-post" writerName="admin" creatorName="admin" path="-1,1061,1066,1067" isDoc=""><bodyText><![CDATA[
<p><strong>Hi there!</strong> , welcome to your new Umbraco powered
blog. Before you start posting away, there''s a handful of things we
thought you should know:</p>

<ol>
<li>
<p>There is a comprehensive and detailed usage and configuration
manual, which covers everything about setting up this blog and
about blogging in general</p>

<p><strong><a
href="http://our.umbraco.org/FileDownload?id=498">Download the
usage guide</a></strong></p>
</li>

<li>
<p>This package is open source and developement is community
driven. So if you have an idea for improvement or wish to be a part
of developing this package you should join the conversaion.</p>

<p><a
href="http://our.umbraco.org/projects/blog-4-umbraco"><strong>Go to
the Blog 4 Umbraco project page on our.umbraco.org</strong></a></p>
</li>

<li>
<p>You can change the appearance of this blog by changing the skin
in the umbraco back-end. The skins are powered by the umbraco
community. If you wish to do your own skin or just want to tweak
the current one, you can find guidance in the skinners guide</p>

<p><strong><a
href="http://our.umbraco.org/FileDownload?id=498">Download the
skinners manual</a></strong></p>
</li>

<li>
<p>Chainging the skin is just the first step, everything is
extendable and hackable. This blog uses open standards and follows
umbraco best practices, so everything can be tweaked. Want to know
how to get started? Ask the friendly community at
our.umbraco.org</p>

<p><strong><a href="http://our.umbraco.org">Go to our.umbraco.org
community</a></strong></p>
</li>
</ol>
]]></bodyText><tags><![CDATA[]]></tags><closeComments>1</closeComments><PostDate>2010-09-07T00:00:00</PostDate></umbBlogPost>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1068,'9b801305-ca0a-4189-b94b-34a7779502a3',{ts '2013-01-10 11:40:52.403'},N'<umbTextpage id="1068" parentID="1061" level="2" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="2" createDate="2010-09-07T13:53:39" updateDate="2013-01-10T11:40:52" nodeName="About" urlName="about" writerName="admin" creatorName="admin" path="-1,1061,1068" isDoc=""><bodyText><![CDATA[]]></bodyText><umbracoNaviHide></umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1069,'6a883056-4255-4906-8c01-632ee8611f31',{ts '2013-01-10 11:40:52.687'},N'<umbTextpage id="1069" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="0" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:40:52" nodeName="Installing runway modules" urlName="installing-runway-modules" writerName="admin" creatorName="admin" path="-1,1061,1068,1069" isDoc=""><bodyText><![CDATA[<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.<br /> Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way.</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1070,'0d61300e-b50f-41c8-b02d-63e829414452',{ts '2013-01-10 11:40:52.977'},N'<umbTextpage id="1070" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="1" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:40:52" nodeName="Go further" urlName="go-further" writerName="admin" creatorName="admin" path="-1,1061,1068,1070" isDoc=""><bodyText><![CDATA[<p>The Simple Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Simple Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Simple site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with XSLT and Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with xslt">Microsoft''s xslt</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1071,'830eb25d-3a1a-4446-b270-1dc8798d46b5',{ts '2013-01-10 11:40:53.287'},N'<umbTextpage id="1071" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="2" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:40:53" nodeName="Getting started" urlName="getting-started" writerName="admin" creatorName="admin" path="-1,1061,1068,1071" isDoc=""><bodyText><![CDATA[<p>You''ve installed Umbraco and the basic Simple website.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Simple site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.org" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, either by editing the CSS styles and HTML templates or by selecting and applying a Skin. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as automated navigation. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1072,'319462aa-9729-42e3-b819-b4cc2885657a',{ts '2013-01-10 11:40:53.550'},N'<umbTextpage id="1072" parentID="1061" level="2" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="3" createDate="2010-09-07T13:20:06" updateDate="2013-01-10T11:40:53" nodeName="Contact us" urlName="contact-us" writerName="admin" creatorName="admin" path="-1,1061,1072" isDoc=""><bodyText><![CDATA[<h3>Office address</h3>
<p>Company Name<br />Streetname 3432<br />DK-9872 City Name</p>
<p>Country</p>
<p><strong>Phone</strong>: +45 3728-282-829</p>
<p><strong>Fax</strong>:  +45 3728-282-829</p>
<p> </p>
<h3>Send us an email</h3>
<p>This contact form sends email to the addresse configured on the macro itself, edit the page in umbraco to change the addresse</p>
<p>Also ensure that your smtp email settings are correct, these are set in the <strong>web.config </strong>file located in the root of your website.</p>
<?UMBRACO_MACRO subject="Email from your website" youremail="name@domain.com" macroAlias="RunwayContactForm" />]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1067,'0b15b251-d723-4c6a-8957-c99c8d9529eb',{ts '2013-01-10 11:42:51.083'},N'<umbBlogPost id="1067" parentID="1066" level="3" writerID="0" creatorID="0" nodeType="1054" template="1044" sortOrder="0" createDate="2010-09-07T13:31:05" updateDate="2013-01-10T11:40:54" nodeName="Company blog post" urlName="company-blog-post" writerName="admin" creatorName="admin" path="-1,1061,1066,1067" isDoc=""><bodyText><![CDATA[<p><strong>Hi there!</strong> , welcome to your new Umbraco powered blog. Before you start posting away, there''s a handful of things we thought you should know:</p>
<ol>
<li>
<p>There is a comprehensive and detailed usage and configuration manual, which covers everything about setting up this blog and about blogging in general</p>
<p><strong><a href="http://our.umbraco.org/FileDownload?id=498">Download the usage guide</a></strong></p>
</li>
<li>
<p>This package is open source and developement is community driven. So if you have an idea for improvement or wish to be a part of developing this package you should join the conversaion.</p>
<p><a href="http://our.umbraco.org/projects/blog-4-umbraco"><strong>Go to the Blog 4 Umbraco project page on our.umbraco.org</strong></a></p>
</li>
<li>
<p>You can change the appearance of this blog by changing the skin in the umbraco back-end. The skins are powered by the umbraco community. If you wish to do your own skin or just want to tweak the current one, you can find guidance in the skinners guide</p>
<p><strong><a href="http://our.umbraco.org/FileDownload?id=498">Download the skinners manual</a></strong></p>
</li>
<li>
<p>Chainging the skin is just the first step, everything is extendable and hackable. This blog uses open standards and follows umbraco best practices, so everything can be tweaked. Want to know how to get started? Ask the friendly community at our.umbraco.org</p>
<p><strong><a href="http://our.umbraco.org">Go to our.umbraco.org community</a></strong></p>
</li>
</ol>]]></bodyText><tags><![CDATA[umbraco]]></tags><closeComments>1</closeComments><PostDate>2010-09-07T00:00:00</PostDate></umbBlogPost>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1069,'fa45e37d-bde7-43fa-bbc0-04277d3f733c',{ts '2013-01-10 11:43:16.650'},N'<umbTextpage id="1069" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="0" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:40:54" nodeName="Installing runway modules" urlName="installing-runway-modules" writerName="admin" creatorName="admin" path="-1,1061,1068,1069" isDoc=""><bodyText><![CDATA[<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.<br /> Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way...</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1071,'065633ab-e616-4950-bffe-46d64abcd8b4',{ts '2013-01-10 11:43:29.290'},N'<umbTextpage id="1071" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="0" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:40:54" nodeName="Getting started" urlName="getting-started" writerName="admin" creatorName="admin" path="-1,1061,1068,1071" isDoc=""><bodyText><![CDATA[<p>You''ve installed Umbraco and the basic Simple website.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Simple site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.org" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, either by editing the CSS styles and HTML templates or by selecting and applying a Skin. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as automated navigation. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.!</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (1071,'e1350e35-663c-4273-b9e2-acc1c30ef15e',{ts '2013-01-10 11:48:56.333'},N'<umbTextpage id="1071" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="0" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:43:29" nodeName="Getting started" urlName="getting-started" writerName="admin" creatorName="admin" path="-1,1061,1068,1071" isDoc=""><bodyText><![CDATA[<p><strong>You''ve installed Umbraco and the basic Simple website.</strong></p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Simple site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.org" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, either by editing the CSS styles and HTML templates or by selecting and applying a Skin. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as automated navigation. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.!</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
SET IDENTITY_INSERT [cmsMacroPropertyType] ON;
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (3,N'mediaCurrent',N'umbraco.macroRenderings',N'media',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (4,N'contentSubs',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (5,N'contentRandom',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (6,N'contentPicker',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (13,N'number',N'umbraco.macroRenderings',N'numeric',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (14,N'bool',N'umbraco.macroRenderings',N'yesNo',N'Boolean');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (16,N'text',N'umbraco.macroRenderings',N'text',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (17,N'contentTree',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (18,N'contentType',N'umbraco.macroRenderings',N'contentTypeSingle',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (19,N'contentTypeMultiple',N'umbraco.macroRenderings',N'contentTypeMultiple',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (20,N'contentAll',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (21,N'tabPicker',N'umbraco.macroRenderings',N'tabPicker',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (22,N'tabPickerMultiple',N'umbraco.macroRenderings',N'tabPickerMultiple',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (23,N'propertyTypePicker',N'umbraco.macroRenderings',N'propertyTypePicker',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (24,N'propertyTypePickerMultiple',N'umbraco.macroRenderings',N'propertyTypePickerMultiple',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (25,N'textMultiLine',N'umbraco.macroRenderings',N'textMultiple',N'String');
GO
SET IDENTITY_INSERT [cmsMacroPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] ON;
GO
INSERT INTO [cmsMacroProperty] ([id],[macroPropertyHidden],[macroPropertyType],[macro],[macroPropertySortOrder],[macroPropertyAlias],[macroPropertyName]) VALUES (1,1,16,5,0,N'CommentsClosedMessage',N'Comments Closed Message');
GO
INSERT INTO [cmsMacroProperty] ([id],[macroPropertyHidden],[macroPropertyType],[macro],[macroPropertySortOrder],[macroPropertyAlias],[macroPropertyName]) VALUES (2,1,14,11,0,N'iscommentfeed',N'iscommentfeed');
GO
INSERT INTO [cmsMacroProperty] ([id],[macroPropertyHidden],[macroPropertyType],[macro],[macroPropertySortOrder],[macroPropertyAlias],[macroPropertyName]) VALUES (3,1,16,18,0,N'Subject',N'Subject');
GO
INSERT INTO [cmsMacroProperty] ([id],[macroPropertyHidden],[macroPropertyType],[macro],[macroPropertySortOrder],[macroPropertyAlias],[macroPropertyName]) VALUES (4,1,16,18,0,N'YourEmail',N'Your Email');
GO
INSERT INTO [cmsMacroProperty] ([id],[macroPropertyHidden],[macroPropertyType],[macro],[macroPropertySortOrder],[macroPropertyAlias],[macroPropertyName]) VALUES (5,1,16,19,0,N'feedUrl',N'Url to feed (including http://)');
GO
INSERT INTO [cmsMacroProperty] ([id],[macroPropertyHidden],[macroPropertyType],[macro],[macroPropertySortOrder],[macroPropertyAlias],[macroPropertyName]) VALUES (6,1,13,19,0,N'numberOfItems',N'Number of Items to list');
GO
INSERT INTO [cmsMacroProperty] ([id],[macroPropertyHidden],[macroPropertyType],[macro],[macroPropertySortOrder],[macroPropertyAlias],[macroPropertyName]) VALUES (7,1,13,19,0,N'excerptLength',N'Excerpt Length (0 for full description)');
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] ON;
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (1,0,0,N'umb2ndLevelNavigation',N'2nd Level Navigation',N'',N'',N'umb2ndLevelNavigation.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (2,0,0,N'BlogArchive',N'Blog Archive',N'',N'',N'umbBlogArchive.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (3,0,0,N'BlogBlogroll',N'Blog Blogroll',N'',N'',N'umbBlogroll.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (4,0,0,N'BlogCategories',N'Blog Categories',N'',N'',N'umbBlogCategories.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (5,0,0,N'frmBlogComment',N'Blog Comment Form',N'usercontrols/Blog/AjaxCommentForm.ascx',N'',N'',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (6,1,0,N'BlogFullArchive',N'Blog Full Archive',N'',N'',N'umbBlogFullArchive.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (7,0,0,N'BlogLatestComments',N'Blog Latest Comments',N'',N'',N'umbBlogLatestComments.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (8,1,0,N'BlogListPosts',N'Blog List Posts',N'',N'',N'umbBlogListPosts.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (9,0,0,N'BlogMetaWeblogChannel',N'Blog Meta Weblog Channel',N'',N'',N'umbBlogMetaWeblogChannel.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (10,0,0,N'BlogPostListComments',N'Blog Post List Comments',N'',N'',N'umbBlogPostListComments.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (11,0,0,N'BlogRss',N'Blog Rss',N'',N'',N'umbBlogRss.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (12,0,0,N'BlogRssFeedLink',N'Blog Rss Feed Link',N'',N'',N'umbBlogRssFeedLink.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (13,1,0,N'BlogTagcloud',N'Blog Tagcloud',N'',N'',N'umbBlogTagcloud.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (14,0,0,N'Blogpages',N'Blogpages',N'',N'',N'umbBlogpages.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (15,0,0,N'BlogpostRelatedPages',N'Blogpost Related Pages',N'',N'',N'umbBlogpostRelatedPages.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (16,1,0,N'umbBusinessFrontpageNews',N'Business Frontpage News',N'',N'',N'umbBusinessFrontpageNews.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (17,1,0,N'umbBusinessFrontpageBlog',N'Business Frontpage Blog',N'',N'',N'umbBusinessFrontpageBlog.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (18,1,0,N'RunwayContactForm',N'Contact Form',N'usercontrols/RunwayContactForm/Contact.ascx',N'',N'',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (19,1,0,N'umbFeedViewer',N'Feed Viewer',N'',N'',N'umbfeedViewer.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (20,0,0,N'umbNewsListItems',N'News List Items',N'',N'',N'umbNewsListItems.xslt',1,0,0,N'');
GO
INSERT INTO [cmsMacro] ([id],[macroUseInEditor],[macroRefreshRate],[macroAlias],[macroName],[macroScriptType],[macroScriptAssembly],[macroXSLT],[macroCacheByPage],[macroCachePersonalized],[macroDontRender],[macroPython]) VALUES (21,0,0,N'umbTopNavigation',N'Top Navigation',N'',N'',N'umbTopNavigation.xslt',1,0,0,N'');
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1053,1047,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1054,1044,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1055,1043,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1056,1046,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1057,1048,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1058,1049,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (1059,1052,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1061,1,0,'3c22a413-d136-4d21-be8b-8a0d3d6b80db',N'Business Site',NULL,NULL,{ts '2013-01-10 11:40:51.110'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1062,1,0,'3943e8dd-4f26-4807-9c8a-0e67b7994ad4',N'Company News',NULL,NULL,{ts '2013-01-10 11:40:51.253'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1063,1,0,'03bb0418-3581-4bcd-a5d2-0fe5b58b8244',N'Another record year',NULL,NULL,{ts '2013-01-10 11:40:51.320'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1064,1,0,'5336d895-f777-4a87-9a2a-69526d4f7906',N'Finance department news',NULL,NULL,{ts '2013-01-10 11:40:51.390'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1065,1,0,'31355ff7-b966-445a-9597-d0c3a0a7d39a',N'Stocks are up',NULL,NULL,{ts '2013-01-10 11:40:51.470'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1066,1,0,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',N'Company Blog',NULL,NULL,{ts '2013-01-10 11:40:51.760'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1067,0,0,'e26c0321-36aa-4f73-9da4-507be689a5ef',N'Company blog post',NULL,NULL,{ts '2013-01-10 11:40:52.127'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1068,1,0,'9b801305-ca0a-4189-b94b-34a7779502a3',N'About',NULL,NULL,{ts '2013-01-10 11:40:52.383'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1069,0,0,'6a883056-4255-4906-8c01-632ee8611f31',N'Installing runway modules',NULL,NULL,{ts '2013-01-10 11:40:52.667'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1070,1,0,'0d61300e-b50f-41c8-b02d-63e829414452',N'Go further',NULL,NULL,{ts '2013-01-10 11:40:52.957'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1071,0,0,'830eb25d-3a1a-4446-b270-1dc8798d46b5',N'Getting started',NULL,NULL,{ts '2013-01-10 11:40:53.273'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1072,1,0,'319462aa-9729-42e3-b819-b4cc2885657a',N'Contact us',NULL,NULL,{ts '2013-01-10 11:40:53.540'},NULL,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1061,0,0,'693896e8-8ac8-4b4a-86b2-c6f2c26cd6cc',N'Business Site',NULL,NULL,{ts '2013-01-10 11:40:53.727'},1046,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1062,0,0,'2df478d5-58f7-461e-bfa7-cffa7abc8e06',N'Company News',NULL,NULL,{ts '2013-01-10 11:40:53.810'},1048,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1063,0,0,'f654cd46-1da6-4518-a6c3-59da72fa85ac',N'Another record year',NULL,NULL,{ts '2013-01-10 11:40:53.857'},1049,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1064,0,0,'7a2895d3-b745-45ee-978b-d5da2e280ee0',N'Finance department news',NULL,NULL,{ts '2013-01-10 11:40:53.913'},1049,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1065,0,0,'3d92dbd3-9288-4587-845b-52a9f1d8b8c4',N'Stocks are up',NULL,NULL,{ts '2013-01-10 11:40:53.973'},1049,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1066,0,0,'0042e7a7-e6e5-4677-a6e3-87c379d70915',N'Company Blog',NULL,NULL,{ts '2013-01-10 11:40:54.027'},1047,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1067,1,0,'0b15b251-d723-4c6a-8957-c99c8d9529eb',N'Company blog post',NULL,NULL,{ts '2013-01-10 11:42:51.037'},1044,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1068,0,0,'9ac46958-dc02-4c23-9632-dc862505a91e',N'About',NULL,NULL,{ts '2013-01-10 11:40:54.460'},1052,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1069,1,0,'fa45e37d-bde7-43fa-bbc0-04277d3f733c',N'Installing runway modules',NULL,NULL,{ts '2013-01-10 11:43:16.617'},1052,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1070,0,0,'381ecc59-1574-4b8e-8528-8454b3b808b0',N'Go further',NULL,NULL,{ts '2013-01-10 11:40:54.573'},1052,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1071,1,0,'065633ab-e616-4950-bffe-46d64abcd8b4',N'Getting started',NULL,NULL,{ts '2013-01-10 11:43:29.240'},1052,NULL,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1072,0,0,'1ea853c4-8e42-40ad-b2f7-12a7952fd6d0',N'Contact us',NULL,NULL,{ts '2013-01-10 11:40:54.687'},1052,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1067,0,0,'e3990769-396e-41a5-9c42-029bbabcc175',N'Company blog post',NULL,NULL,{ts '2013-01-10 11:42:51.447'},1044,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1069,0,0,'ccd7b4d8-7c9f-48bd-a07e-ce88ff6a6777',N'Installing runway modules',NULL,NULL,{ts '2013-01-10 11:43:16.900'},1052,NULL,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[alias],[newest]) VALUES (1071,0,0,'e1350e35-663c-4273-b9e2-acc1c30ef15e',N'Getting started',NULL,NULL,{ts '2013-01-10 11:48:56.267'},1052,NULL,1);
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] ON;
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (3,-87,N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|',0,N'');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (4,1041,N'default',0,N'group');
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] OFF;
GO
SET IDENTITY_INSERT [cmsDataType] ON;
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (4,-49,'38b352c1-e9f8-4fd8-9324-9a2eab06d97a',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (6,-51,'1413afcb-d19a-4173-8e9a-68288d2a73b8',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (8,-87,'5e9b75ae-face-41c8-b47e-5f4b0fd82f83',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (9,-88,'ec15c1e5-9d90-422a-aa52-4f7622c63bea',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (10,-89,'67db8357-ef57-493e-91ac-936d305e0f2a',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (11,-90,'5032a6e6-69e3-491d-bb28-cd31cd11086c',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (12,-91,'a74ea9c9-8e18-4d2a-8cf6-73c6206c5da6',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (13,-92,'6c738306-4c17-4d88-b9bd-6546f3771597',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (14,-36,'b6fb1622-afa5-4bbf-a3cc-d9672a442222',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (15,-37,'f8d60f68-ec59-4974-b43b-c46eb5677985',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (16,-38,'cccd4ae9-f399-4ed2-8038-2e88d19e810c',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (17,-39,'928639ed-9c73-4028-920c-1e55dbb68783',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (18,-40,'a52c7c1c-c330-476e-8605-d63d3b84b6a6',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (19,-41,'23e93522-3200-44e2-9f29-e61a6fcbb79a',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (20,-42,'a74ea9c9-8e18-4d2a-8cf6-73c6206c5da6',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (21,-43,'b4471851-82b6-4c75-afa4-39fa9c6a75e9',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (22,-44,'a3776494-0574-4d93-b7de-efdfdec6f2d1',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (23,-128,'a52c7c1c-c330-476e-8605-d63d3b84b6a6',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (24,-129,'928639ed-9c73-4028-920c-1e55dbb68783',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (25,-130,'a74ea9c9-8e18-4d2a-8cf6-73c6206c5da6',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (26,-131,'a74ea9c9-8e18-4d2a-8cf6-73c6206c5da6',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (27,-132,'a74ea9c9-8e18-4d2a-8cf6-73c6206c5da6',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (28,-133,'6c738306-4c17-4d88-b9bd-6546f3771597',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (29,-134,'928639ed-9c73-4028-920c-1e55dbb68783',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (30,-50,'aaf99bb2-dbbe-444d-a296-185076bf0484',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (31,1034,'158aa029-24ed-4948-939e-c3da209e5fba',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (32,1035,'ead69342-f06d-4253-83ac-28000225583b',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (33,1036,'39f533e4-0551-4505-a64b-e0425c5ce775',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (35,1038,'60b7dabf-99cd-41eb-b8e9-4d2e669bbde9',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (36,1039,'cdbf0b5d-5cb2-445f-bc12-fcaaec07cf2c',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (37,1040,'71b8ad1a-8dc2-425c-b6b8-faa158075e63',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (38,1041,'4023e540-92f5-11dd-ad8b-0800200c9a66',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (39,1042,'e66af4a0-e8b4-11de-8a39-0800200c9a66',N'Ntext');
GO
SET IDENTITY_INSERT [cmsDataType] OFF;
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1061,N'<umbHomepage id="1061" parentID="-1" level="1" writerID="0" creatorID="0" nodeType="1056" template="1046" sortOrder="0" createDate="2010-09-07T13:19:39" updateDate="2013-01-10T11:40:53" nodeName="Business Site" urlName="business-site" writerName="admin" creatorName="admin" path="-1,1061" isDoc=""><bodyText><![CDATA[<p>The Simple Starter Kit gives you a bare-bones website that introduces you to a set of well-defined conventions for building an Umbraco website.</p>
<p>The Simple website is very basic in form and provided without any design or functionality - unless you add a Skin, of course. By installing the Simple Starter Kit, you''ll begin with a minimal site built on best practices. You''ll also enjoy the benefits of speaking the same "language" as the rest of the Umbraco community by using common properties and naming conventions.</p>
<p>Now that you know what the Simple site is, it is time to get started using Umbraco.</p>]]></bodyText><siteName>Business site</siteName><siteDescription><![CDATA[Off to a great start]]></siteDescription></umbHomepage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1062,N'<umbNewsArea id="1062" parentID="1061" level="2" writerID="0" creatorID="0" nodeType="1057" template="1048" sortOrder="0" createDate="2010-09-07T13:22:05" updateDate="2013-01-10T11:40:53" nodeName="Company News" urlName="company-news" writerName="admin" creatorName="admin" path="-1,1061,1062" isDoc="" />');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1063,N'<umbNewsArticle id="1063" parentID="1062" level="3" writerID="0" creatorID="0" nodeType="1058" template="1049" sortOrder="0" createDate="2010-09-07T13:22:21" updateDate="2013-01-10T11:40:53" nodeName="Another record year" urlName="another-record-year" writerName="admin" creatorName="admin" path="-1,1061,1062,1063" isDoc=""><introduction><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id enim vel metus dignissim fermentum. Donec molestie pulvinar ultricies. Donec ullamcorper facilisis mattis. Sed id condimentum dui. Vivamus ornare congue facilisis. Nulla arcu lorem, sollicitudin at tincidunt nec, congue in dolor. Morbi mattis magna non risus convallis non dignissim sapien dictum.]]></introduction><bodyText><![CDATA[
<p>Nam consectetur risus quis diam dignissim convallis. Donec
congue arcu at ligula venenatis facilisis. Donec tincidunt, augue
vel venenatis suscipit, ipsum orci pretium lacus, et tempor felis
nisi eu diam. Fusce vel turpis quis nisl viverra pharetra sit amet
et risus. Donec interdum ullamcorper sodales. Mauris feugiat velit
rhoncus sapien sagittis venenatis quis non purus. Cras ac arcu
velit.</p>

<p>Class aptent taciti sociosqu ad litora torquent per conubia
nostra, per inceptos himenaeos. Etiam non tortor nec risus laoreet
auctor. Mauris ipsum ligula, suscipit fermentum interdum id,
facilisis eu felis. Proin ut porttitor tortor. Proin quis pulvinar
urna. Nullam cursus feugiat feugiat. Praesent iaculis lacus at arcu
feugiat suscipit. Proin elementum tortor vitae massa euismod
tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut
ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue
magna, sodales eu consectetur vestibulum, consequat in libero.
Nulla facilisi. Nunc id ligula urna. Sed tempus bibendum eros, a
posuere ante varius eu. Mauris quis neque nec felis laoreet
eleifend. Nullam bibendum molestie bibendum. Aenean vestibulum
sodales orci sed mollis.</p>

<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>
]]></bodyText></umbNewsArticle>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1064,N'<umbNewsArticle id="1064" parentID="1062" level="3" writerID="0" creatorID="0" nodeType="1058" template="1049" sortOrder="1" createDate="2010-09-07T13:22:35" updateDate="2013-01-10T11:40:53" nodeName="Finance department news" urlName="finance-department-news" writerName="admin" creatorName="admin" path="-1,1061,1062,1064" isDoc=""><introduction><![CDATA[Tortor vitae massa euismod tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue magna, sodales eu consectetur vestibulum, consequat in libero. Nulla facilisi. Nunc id ligula urna.]]></introduction><bodyText><![CDATA[
<p>Class aptent taciti sociosqu ad litora torquent per conubia
nostra, per inceptos himenaeos. Etiam non tortor nec risus laoreet
auctor. Mauris ipsum ligula, suscipit fermentum interdum id,
facilisis eu felis. Proin ut porttitor tortor. Proin quis pulvinar
urna. Nullam cursus feugiat feugiat. Praesent iaculis lacus at arcu
feugiat suscipit. Proin elementum tortor vitae massa euismod
tempus. Donec adipiscing nunc lacinia felis aliquam mattis. Ut
ipsum nisl, ultrices nec vehicula vel, blandit vel nibh. Nam augue
magna, sodales eu consectetur vestibulum, consequat in libero.
Nulla facilisi. Nunc id ligula urna. Sed tempus bibendum eros, a
posuere ante varius eu. Mauris quis neque nec felis laoreet
eleifend. Nullam bibendum molestie bibendum. Aenean vestibulum
sodales orci sed mollis.</p>

<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque
urna sodales quis rutrum sapien consectetur. Nam consectetur semper
augue sit amet fringilla. Curabitur vel magna rhoncus ipsum
pharetra aliquet. Morbi et molestie justo. Fusce congue tellus
aliquam leo sollicitudin nec bibendum sapien egestas. Pellentesque
nec sapien enim. Phasellus justo leo, congue dapibus euismod id,
luctus ut ante. Curabitur justo metus, faucibus eget placerat sit
amet, fringilla eget urna. Aliquam a leo ipsum.</p>
]]></bodyText></umbNewsArticle>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1065,N'<umbNewsArticle id="1065" parentID="1062" level="3" writerID="0" creatorID="0" nodeType="1058" template="1049" sortOrder="2" createDate="2010-09-07T13:22:53" updateDate="2013-01-10T11:40:53" nodeName="Stocks are up" urlName="stocks-are-up" writerName="admin" creatorName="admin" path="-1,1061,1062,1065" isDoc=""><introduction><![CDATA[Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque urna sodales quis rutrum sapien consectetur. Nam consectetur semper augue sit amet fringilla. Curabitur vel magna rhoncus ipsum pharetra aliquet.]]></introduction><bodyText><![CDATA[
<p>Duis tempor scelerisque condimentum. Proin convallis placerat
odio, at dictum risus tempor id. Maecenas vel erat ac enim
convallis vehicula at et mi. Fusce ut faucibus odio. Vestibulum
pharetra mollis sem, at viverra nunc facilisis non. Vivamus
vulputate nibh et ligula dictum interdum. Aenean at libero et quam
ultricies dignissim in id tellus. Curabitur tincidunt nibh
ullamcorper ligula dapibus volutpat. Vestibulum neque augue,
blandit vitae ornare at, facilisis at sapien. Lorem ipsum dolor sit
amet, consectetur adipiscing elit. Curabitur non mollis lacus. Ut
sed pulvinar nulla.</p>

<p>Pellentesque habitant morbi tristique senectus et netus et
malesuada fames ac turpis egestas. Nunc rhoncus neque pellentesque
urna sodales quis rutrum sapien consectetur. Nam consectetur semper
augue sit amet fringilla. Curabitur vel magna rhoncus ipsum
pharetra aliquet. Morbi et molestie justo. Fusce congue tellus
aliquam leo sollicitudin nec bibendum sapien egestas. Pellentesque
nec sapien enim. Phasellus justo leo, congue dapibus euismod id,
luctus ut ante. Curabitur justo metus, faucibus eget placerat sit
amet, fringilla eget urna. Aliquam a leo ipsum.</p>

<p>In nec tristique odio. Proin fringilla lobortis neque sit amet
dapibus. Maecenas mollis tempor lacus, ac commodo sem condimentum
ac. Nulla facilisi. Duis eleifend placerat laoreet. In fringilla
accumsan leo a laoreet. Sed tincidunt nisl a risus blandit
pellentesque. Mauris in ante ac sapien semper sagittis. Etiam
luctus posuere pulvinar. Sed eros sem, sollicitudin a laoreet non,
ultrices nec nulla. Morbi tempus, nunc ac malesuada tempus, ipsum
neque sodales ipsum, et lacinia libero tellus a risus. Integer sit
amet purus nibh, in aliquam nisi. Curabitur non imperdiet libero.
Quisque magna massa, vestibulum vitae laoreet sit amet, luctus eu
elit. Nam eros mi, consectetur a eleifend sed, tincidunt id
odio.</p>
]]></bodyText></umbNewsArticle>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1066,N'<umbBlog id="1066" parentID="1061" level="2" writerID="0" creatorID="0" nodeType="1053" template="1047" sortOrder="1" createDate="2010-09-07T13:26:10" updateDate="2013-01-10T11:40:54" nodeName="Company Blog" urlName="company-blog" writerName="admin" creatorName="admin" path="-1,1061,1066" isDoc=""><siteName></siteName><siteDescription><![CDATA[ ]]></siteDescription><blogroll><links /></blogroll><akismetAPIKey></akismetAPIKey><owner><![CDATA[0]]></owner><pingServices><links /></pingServices><bodyText><![CDATA[<?UMBRACO_MACRO macroAlias="BlogListPosts" />]]></bodyText></umbBlog>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1067,N'<umbBlogPost id="1067" parentID="1066" level="3" writerID="0" creatorID="0" nodeType="1054" template="1044" sortOrder="0" createDate="2010-09-07T13:31:05" updateDate="2013-01-10T11:42:51" nodeName="Company blog post" urlName="company-blog-post" writerName="admin" creatorName="admin" path="-1,1061,1066,1067" isDoc=""><bodyText><![CDATA[<p><strong>Hi there!</strong> , welcome to your new Umbraco powered blog. Before you start posting away, there''s a handful of things we thought you should know:</p>
<ol>
<li>
<p>There is a comprehensive and detailed usage and configuration manual, which covers everything about setting up this blog and about blogging in general</p>
<p><strong><a href="http://our.umbraco.org/FileDownload?id=498">Download the usage guide</a></strong></p>
</li>
<li>
<p>This package is open source and developement is community driven. So if you have an idea for improvement or wish to be a part of developing this package you should join the conversaion.</p>
<p><a href="http://our.umbraco.org/projects/blog-4-umbraco"><strong>Go to the Blog 4 Umbraco project page on our.umbraco.org</strong></a></p>
</li>
<li>
<p>You can change the appearance of this blog by changing the skin in the umbraco back-end. The skins are powered by the umbraco community. If you wish to do your own skin or just want to tweak the current one, you can find guidance in the skinners guide</p>
<p><strong><a href="http://our.umbraco.org/FileDownload?id=498">Download the skinners manual</a></strong></p>
</li>
<li>
<p>Chainging the skin is just the first step, everything is extendable and hackable. This blog uses open standards and follows umbraco best practices, so everything can be tweaked. Want to know how to get started? Ask the friendly community at our.umbraco.org</p>
<p><strong><a href="http://our.umbraco.org">Go to our.umbraco.org community</a></strong></p>
</li>
</ol>]]></bodyText><tags><![CDATA[umbraco]]></tags><closeComments>1</closeComments><PostDate>2010-09-07T00:00:00</PostDate></umbBlogPost>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1068,N'<umbTextpage id="1068" parentID="1061" level="2" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="2" createDate="2010-09-07T13:53:39" updateDate="2013-01-10T11:40:54" nodeName="About" urlName="about" writerName="admin" creatorName="admin" path="-1,1061,1068" isDoc=""><bodyText><![CDATA[]]></bodyText><umbracoNaviHide></umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1069,N'<umbTextpage id="1069" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="0" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:43:16" nodeName="Installing runway modules" urlName="installing-runway-modules" writerName="admin" creatorName="admin" path="-1,1061,1068,1069" isDoc=""><bodyText><![CDATA[<p>Umbraco modules encapsulate specific bits of advanced functionality that are easily added to your website.</p>
<p>Once installed, Umbraco modules are open source and easy to customize if you want to modify the behavior for your specific needs.<br /> Because Umbraco modules are provided under the MIT license you are free to use and modify them any way you want, with no strings attached.</p>
<p>To add Umbraco modules to your website, go to the <strong>Settings</strong> section, expand the <strong>Templates</strong> item, select the <strong>Starterkit Master</strong> template, then click the <strong>Customize Skin</strong> button on the toolbar.</p>
<p>Umbraco modules are available for various kinds of navigation, a sitemap, social media feeds, and a contact form. The list of available Umbraco modules is growing rapidly and is automatically updated from a central source, always fresh and current.</p>
<p><a href="http://umbraco.org/get-started" title="Get Started with Umbraco">Get more information</a> about the umbraco way...</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1070,N'<umbTextpage id="1070" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="1" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:40:54" nodeName="Go further" urlName="go-further" writerName="admin" creatorName="admin" path="-1,1061,1068,1070" isDoc=""><bodyText><![CDATA[<p>The Simple Starter Kit only scratches the surface of what''s possible with Umbraco. Below the Simple Starter Kit and its modules lies a great architecture that lets you implement whatever you need.</p>
<p>With Umbraco you''ve finally got a solid, open and reliable platform for websites as basic as the Simple site, and Umbraco can be rapidly expanded to support multi-language websites, collaboration platforms and intra/extranets, to name just a few.</p>
<p>Advanced functionality is created with Umbraco macros, built with XSLT and Umbraco''s award-winning .NET integration, including full support for any .NET User or Custom control. Create and integrate your own .NET macros in mere minutes with point and click simplicity. Simply copy your controls to the Umbraco website, go to the <strong>Developer</strong> section and create a new macro, selecting your control from the list.</p>
<p>You can also use <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started/working-with-webmatrix" title="Working with xslt">Microsoft''s xslt</a> syntax to quickly add dynamic functionality to your site.</p>
<p>We''ve also gathered the best community macros into a repository that''s also accessed from the <strong>Developer</strong> section, in the <strong>Packages</strong> area. You can find more information <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/what-are-macros" title="About creating Umbraco macros">about creating macros</a>, on the Umbraco website.</p>
<p>The sky is the limit with Umbraco, and you have the benefit a friendly community, training, and guaranteed support. Find out how to <a href="http://umbraco.org/help-and-support" title="Get Umbraco Support">get help</a>.</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1071,N'<umbTextpage id="1071" parentID="1068" level="3" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="2" createDate="2010-09-07T13:19:40" updateDate="2013-01-10T11:43:29" nodeName="Getting started" urlName="getting-started" writerName="admin" creatorName="admin" path="-1,1061,1068,1071" isDoc=""><bodyText><![CDATA[<p>You''ve installed Umbraco and the basic Simple website.</p>
<p>Edit the text on the homepage and create a site structure by adding new texpages to your site. This is all done in the <strong>Content</strong> section.</p>
<p>If you find the editing options provided by the Simple site too limited for you needs, simply add more properties to the page by going to the <strong>Settings</strong> section, expanding the <strong>Document Types</strong> item and adding new properties on the <strong>Generic Properties</strong> tab. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/document-types" title="About Umbraco Document Types">document types and properties</a> at the <a href="http://umbraco.org" title="The Umbraco Website">Umbraco website</a>.</p>
<p>You''ll probably want to personalize your site by changing the current design. This is also done in the <strong>Settings</strong> section, either by editing the CSS styles and HTML templates or by selecting and applying a Skin. Umbraco uses master templates, so the main, common markup is placed in the <strong>Starterkit Master</strong> template, while the Homeage and Textpage have separate templates for their unique layouts. You can find more information about <a href="http://umbraco.org/help-and-support/video-tutorials/introduction-to-umbraco/sitebuilder-introduction/templates" title="Umbraco Templates and Stylesheets">templates and css</a> in umbraco at the umbraco website.</p>
<p>Once you''re happy with your site''s design, you might want to add more functionality, such as automated navigation. This is done by <a href="http://umbraco.org/help-and-support/video-tutorials/getting-started" title="Umbraco Modules">installing Umbraco modules</a>.!</p>]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (1072,N'<umbTextpage id="1072" parentID="1061" level="2" writerID="0" creatorID="0" nodeType="1059" template="1052" sortOrder="3" createDate="2010-09-07T13:20:06" updateDate="2013-01-10T11:40:54" nodeName="Contact us" urlName="contact-us" writerName="admin" creatorName="admin" path="-1,1061,1072" isDoc=""><bodyText><![CDATA[<h3>Office address</h3>
<p>Company Name<br />Streetname 3432<br />DK-9872 City Name</p>
<p>Country</p>
<p><strong>Phone</strong>: +45 3728-282-829</p>
<p><strong>Fax</strong>:  +45 3728-282-829</p>
<p> </p>
<h3>Send us an email</h3>
<p>This contact form sends email to the addresse configured on the macro itself, edit the page in umbraco to change the addresse</p>
<p>Also ensure that your smtp email settings are correct, these are set in the <strong>web.config </strong>file located in the root of your website.</p>
<?UMBRACO_MACRO subject="Email from your website" youremail="name@domain.com" macroAlias="RunwayContactForm" />]]></bodyText><umbracoNaviHide>0</umbracoNaviHide></umbTextpage>');
GO
SET IDENTITY_INSERT [cmsContentVersion] ON;
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (1,1061,'3c22a413-d136-4d21-be8b-8a0d3d6b80db',{ts '2013-01-10 11:40:51.013'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (2,1062,'3943e8dd-4f26-4807-9c8a-0e67b7994ad4',{ts '2013-01-10 11:40:51.213'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (3,1063,'03bb0418-3581-4bcd-a5d2-0fe5b58b8244',{ts '2013-01-10 11:40:51.270'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (4,1064,'5336d895-f777-4a87-9a2a-69526d4f7906',{ts '2013-01-10 11:40:51.343'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (5,1065,'31355ff7-b966-445a-9597-d0c3a0a7d39a',{ts '2013-01-10 11:40:51.413'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (6,1066,'ef6b71ed-5aeb-4777-b74d-ad9703dc01ab',{ts '2013-01-10 11:40:51.560'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (7,1067,'e26c0321-36aa-4f73-9da4-507be689a5ef',{ts '2013-01-10 11:40:51.933'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (8,1068,'9b801305-ca0a-4189-b94b-34a7779502a3',{ts '2013-01-10 11:40:52.230'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (9,1069,'6a883056-4255-4906-8c01-632ee8611f31',{ts '2013-01-10 11:40:52.500'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (10,1070,'0d61300e-b50f-41c8-b02d-63e829414452',{ts '2013-01-10 11:40:52.773'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (11,1071,'830eb25d-3a1a-4446-b270-1dc8798d46b5',{ts '2013-01-10 11:40:53.087'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (12,1072,'319462aa-9729-42e3-b819-b4cc2885657a',{ts '2013-01-10 11:40:53.373'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (13,1061,'693896e8-8ac8-4b4a-86b2-c6f2c26cd6cc',{ts '2013-01-10 11:40:53.727'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (14,1062,'2df478d5-58f7-461e-bfa7-cffa7abc8e06',{ts '2013-01-10 11:40:53.810'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (15,1063,'f654cd46-1da6-4518-a6c3-59da72fa85ac',{ts '2013-01-10 11:40:53.857'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (16,1064,'7a2895d3-b745-45ee-978b-d5da2e280ee0',{ts '2013-01-10 11:40:53.913'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (17,1065,'3d92dbd3-9288-4587-845b-52a9f1d8b8c4',{ts '2013-01-10 11:40:53.973'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (18,1066,'0042e7a7-e6e5-4677-a6e3-87c379d70915',{ts '2013-01-10 11:40:54.027'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (19,1067,'0b15b251-d723-4c6a-8957-c99c8d9529eb',{ts '2013-01-10 11:40:54.137'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (20,1068,'9ac46958-dc02-4c23-9632-dc862505a91e',{ts '2013-01-10 11:40:54.460'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (21,1069,'fa45e37d-bde7-43fa-bbc0-04277d3f733c',{ts '2013-01-10 11:40:54.520'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (22,1070,'381ecc59-1574-4b8e-8528-8454b3b808b0',{ts '2013-01-10 11:40:54.573'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (23,1071,'065633ab-e616-4950-bffe-46d64abcd8b4',{ts '2013-01-10 11:40:54.630'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (24,1072,'1ea853c4-8e42-40ad-b2f7-12a7952fd6d0',{ts '2013-01-10 11:40:54.687'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (25,1067,'e3990769-396e-41a5-9c42-029bbabcc175',{ts '2013-01-10 11:42:51.447'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (26,1069,'ccd7b4d8-7c9f-48bd-a07e-ce88ff6a6777',{ts '2013-01-10 11:43:16.900'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (27,1071,'e1350e35-663c-4273-b9e2-acc1c30ef15e',{ts '2013-01-10 11:43:29.550'});
GO
SET IDENTITY_INSERT [cmsContentVersion] OFF;
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId]) VALUES (1031,1031);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId]) VALUES (1031,1032);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId]) VALUES (1031,1033);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId]) VALUES (1053,1054);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId]) VALUES (1053,1055);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId]) VALUES (1053,1059);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId]) VALUES (1055,1054);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId]) VALUES (1059,1059);
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (532,1031,N'Folder',N'folder.gif',N'folder.png',NULL,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (533,1032,N'Image',N'mediaPhoto.gif',N'mediaPhoto.png',NULL,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (534,1033,N'File',N'mediaFile.gif',N'mediaFile.png',NULL,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (535,1053,N'umbBlog',N'.sprTreeFolder',N'folder.png',N'',0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (536,1054,N'umbBlogPost',N'.sprTreeDoc3',N'doc.png',N'',0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (537,1055,N'DateFolder',N'.sprTreeFolder',N'folder.png',N'',0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (538,1056,N'umbHomepage',N'.sprTreeFolder',N'folder.png',N'The homepage of a starter kit website.',0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (539,1057,N'umbNewsArea',N'folder.gif',N'folder.png',N'',0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (540,1058,N'umbNewsArticle',N'.sprTreeDoc2',N'docWithImage.png',N'',0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[masterContentType]) VALUES (541,1059,N'umbTextpage',N'.sprTreeDoc',N'doc.png',N'This is the standard content page for a starter kit website.',0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
SET IDENTITY_INSERT [cmsContent] ON;
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (1,1061,1056);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (2,1062,1057);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (3,1063,1058);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (4,1064,1058);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (5,1065,1058);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (6,1066,1053);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (7,1067,1054);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (8,1068,1059);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (9,1069,1059);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (10,1070,1059);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (11,1071,1059);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (12,1072,1059);
GO
SET IDENTITY_INSERT [cmsContent] OFF;
GO
ALTER TABLE [umbracoUserType] ADD CONSTRAINT [PK_userType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY ([userId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2app] ADD CONSTRAINT [PK_user2app] PRIMARY KEY ([user],[app]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_structure] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_language] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [PK_domains] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAppTree] ADD CONSTRAINT [PK_umbracoAppTree] PRIMARY KEY ([appAlias],[treeAlias]);
GO
ALTER TABLE [umbracoApp] ADD CONSTRAINT [PK_umbracoApp] PRIMARY KEY ([appAlias]);
GO
ALTER TABLE [Comment] ADD CONSTRAINT [PK_Comment] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_templates] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsTaskType] ADD CONSTRAINT [PK_cmsTaskType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [PK_cmsTask] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTab] ADD CONSTRAINT [PK_cmsTab] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsMacroPropertyType] ADD CONSTRAINT [PK_macroPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_macroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_macro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [PK_cmsDocument] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDataTypePreValues] ADD CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [PK_cmsDataType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentXml] ADD CONSTRAINT [PK_cmsContentXml] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsContentVersion] ADD CONSTRAINT [PK__cmsContentVersion__00000000000001BB] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [PK_cmsContent] PRIMARY KEY ([pk]);
GO
CREATE INDEX [IX_cmsPropertyData] ON [cmsPropertyData] ([id] ASC);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [FK_user_userType] FOREIGN KEY ([userType]) REFERENCES [umbracoUserType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2app] ADD CONSTRAINT [FK_umbracoUser2app_umbracoUser] FOREIGN KEY ([user]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode] FOREIGN KEY ([parentID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_cmsTaskType] FOREIGN KEY ([taskTypeId]) REFERENCES [cmsTaskType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsTab] FOREIGN KEY ([tabId]) REFERENCES [cmsTab]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_umbracoNode] FOREIGN KEY ([contentNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_umbracoMacroProperty_umbracoMacroPropertyType] FOREIGN KEY ([macroPropertyType]) REFERENCES [cmsMacroPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [FK_cmsDocument_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [FK_cmsContent_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

