
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/23/2013 00:09:30
-- Generated from EDMX file: C:\git\Sharmusiq\Sharmusiq\Sharmusiq.API\Model\SMDb.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [sharmusiq];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserUserRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_UserUserRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleUserRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_RoleUserRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_TrackTrackFeature]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrackFeatures] DROP CONSTRAINT [FK_TrackTrackFeature];
GO
IF OBJECT_ID(N'[dbo].[FK_UserTrack]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tracks] DROP CONSTRAINT [FK_UserTrack];
GO
IF OBJECT_ID(N'[dbo].[FK_TrackShareRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ShareRequests] DROP CONSTRAINT [FK_TrackShareRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_UserShareRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ShareRequests] DROP CONSTRAINT [FK_UserShareRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_ShareRequestShareResponse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ShareResponses] DROP CONSTRAINT [FK_ShareRequestShareResponse];
GO
IF OBJECT_ID(N'[dbo].[FK_Producer_inherits_TrackFeature]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrackFeatures_Producer] DROP CONSTRAINT [FK_Producer_inherits_TrackFeature];
GO
IF OBJECT_ID(N'[dbo].[FK_Artist_inherits_TrackFeature]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrackFeatures_Artist] DROP CONSTRAINT [FK_Artist_inherits_TrackFeature];
GO
IF OBJECT_ID(N'[dbo].[FK_Venue_inherits_TrackFeature]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrackFeatures_Venue] DROP CONSTRAINT [FK_Venue_inherits_TrackFeature];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Tracks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tracks];
GO
IF OBJECT_ID(N'[dbo].[ShareRequests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShareRequests];
GO
IF OBJECT_ID(N'[dbo].[ShareResponses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShareResponses];
GO
IF OBJECT_ID(N'[dbo].[UserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRoles];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[TrackFeatures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrackFeatures];
GO
IF OBJECT_ID(N'[dbo].[TrackFeatures_Producer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrackFeatures_Producer];
GO
IF OBJECT_ID(N'[dbo].[TrackFeatures_Artist]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrackFeatures_Artist];
GO
IF OBJECT_ID(N'[dbo].[TrackFeatures_Venue]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrackFeatures_Venue];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [IsIdentityDelegated] bit  NULL,
    [ProviderName] nvarchar(max)  NULL,
    [ProviderUserKey] nvarchar(max)  NULL,
    [EmailAddress] nvarchar(max)  NULL,
    [FirstAccessDate] datetime  NULL,
    [LastLoginDate] datetime  NULL
);
GO

-- Creating table 'Tracks'
CREATE TABLE [dbo].[Tracks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Artist] nvarchar(max)  NULL,
    [Genre] nvarchar(max)  NULL,
    [ReleaseYear] int  NULL
);
GO

-- Creating table 'ShareRequests'
CREATE TABLE [dbo].[ShareRequests] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ShareDate] datetime  NOT NULL,
    [Track_Id] int  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'ShareResponses'
CREATE TABLE [dbo].[ShareResponses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ResponseDate] datetime  NOT NULL,
    [Acknowledged] bit  NULL,
    [Message] nvarchar(max)  NOT NULL,
    [ShareRequest_Id] int  NOT NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IsValid] bit  NOT NULL,
    [CreatedOn] datetime  NOT NULL,
    [User_Id] int  NOT NULL,
    [Role_Id] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [IsValid] bit  NULL
);
GO

-- Creating table 'TrackFeatures'
CREATE TABLE [dbo].[TrackFeatures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [IsPrimary] bit  NULL,
    [Track_Id] int  NOT NULL
);
GO

-- Creating table 'Permissions'
CREATE TABLE [dbo].[Permissions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Track_Id] int  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'TrackFeatures_Producer'
CREATE TABLE [dbo].[TrackFeatures_Producer] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'TrackFeatures_Artist'
CREATE TABLE [dbo].[TrackFeatures_Artist] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'TrackFeatures_Venue'
CREATE TABLE [dbo].[TrackFeatures_Venue] (
    [CityState] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tracks'
ALTER TABLE [dbo].[Tracks]
ADD CONSTRAINT [PK_Tracks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ShareRequests'
ALTER TABLE [dbo].[ShareRequests]
ADD CONSTRAINT [PK_ShareRequests]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ShareResponses'
ALTER TABLE [dbo].[ShareResponses]
ADD CONSTRAINT [PK_ShareResponses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TrackFeatures'
ALTER TABLE [dbo].[TrackFeatures]
ADD CONSTRAINT [PK_TrackFeatures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Permissions'
ALTER TABLE [dbo].[Permissions]
ADD CONSTRAINT [PK_Permissions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TrackFeatures_Producer'
ALTER TABLE [dbo].[TrackFeatures_Producer]
ADD CONSTRAINT [PK_TrackFeatures_Producer]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TrackFeatures_Artist'
ALTER TABLE [dbo].[TrackFeatures_Artist]
ADD CONSTRAINT [PK_TrackFeatures_Artist]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TrackFeatures_Venue'
ALTER TABLE [dbo].[TrackFeatures_Venue]
ADD CONSTRAINT [PK_TrackFeatures_Venue]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_UserUserRoles]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserRoles'
CREATE INDEX [IX_FK_UserUserRoles]
ON [dbo].[UserRoles]
    ([User_Id]);
GO

-- Creating foreign key on [Role_Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_RoleUserRoles]
    FOREIGN KEY ([Role_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleUserRoles'
CREATE INDEX [IX_FK_RoleUserRoles]
ON [dbo].[UserRoles]
    ([Role_Id]);
GO

-- Creating foreign key on [Track_Id] in table 'TrackFeatures'
ALTER TABLE [dbo].[TrackFeatures]
ADD CONSTRAINT [FK_TrackTrackFeature]
    FOREIGN KEY ([Track_Id])
    REFERENCES [dbo].[Tracks]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TrackTrackFeature'
CREATE INDEX [IX_FK_TrackTrackFeature]
ON [dbo].[TrackFeatures]
    ([Track_Id]);
GO

-- Creating foreign key on [Track_Id] in table 'ShareRequests'
ALTER TABLE [dbo].[ShareRequests]
ADD CONSTRAINT [FK_TrackShareRequest]
    FOREIGN KEY ([Track_Id])
    REFERENCES [dbo].[Tracks]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TrackShareRequest'
CREATE INDEX [IX_FK_TrackShareRequest]
ON [dbo].[ShareRequests]
    ([Track_Id]);
GO

-- Creating foreign key on [User_Id] in table 'ShareRequests'
ALTER TABLE [dbo].[ShareRequests]
ADD CONSTRAINT [FK_UserShareRequest]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserShareRequest'
CREATE INDEX [IX_FK_UserShareRequest]
ON [dbo].[ShareRequests]
    ([User_Id]);
GO

-- Creating foreign key on [ShareRequest_Id] in table 'ShareResponses'
ALTER TABLE [dbo].[ShareResponses]
ADD CONSTRAINT [FK_ShareRequestShareResponse]
    FOREIGN KEY ([ShareRequest_Id])
    REFERENCES [dbo].[ShareRequests]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ShareRequestShareResponse'
CREATE INDEX [IX_FK_ShareRequestShareResponse]
ON [dbo].[ShareResponses]
    ([ShareRequest_Id]);
GO

-- Creating foreign key on [Track_Id] in table 'Permissions'
ALTER TABLE [dbo].[Permissions]
ADD CONSTRAINT [FK_TrackPermission]
    FOREIGN KEY ([Track_Id])
    REFERENCES [dbo].[Tracks]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TrackPermission'
CREATE INDEX [IX_FK_TrackPermission]
ON [dbo].[Permissions]
    ([Track_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Permissions'
ALTER TABLE [dbo].[Permissions]
ADD CONSTRAINT [FK_UserPermission]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPermission'
CREATE INDEX [IX_FK_UserPermission]
ON [dbo].[Permissions]
    ([User_Id]);
GO

-- Creating foreign key on [Id] in table 'TrackFeatures_Producer'
ALTER TABLE [dbo].[TrackFeatures_Producer]
ADD CONSTRAINT [FK_Producer_inherits_TrackFeature]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[TrackFeatures]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'TrackFeatures_Artist'
ALTER TABLE [dbo].[TrackFeatures_Artist]
ADD CONSTRAINT [FK_Artist_inherits_TrackFeature]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[TrackFeatures]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'TrackFeatures_Venue'
ALTER TABLE [dbo].[TrackFeatures_Venue]
ADD CONSTRAINT [FK_Venue_inherits_TrackFeature]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[TrackFeatures]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------