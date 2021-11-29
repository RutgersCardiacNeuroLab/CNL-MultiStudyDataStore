/* create schemas */
drop schema if exists [cnldev];
go
create schema [cnldev];
go

drop schema if exists [cnlprod];
go
create schema [cnlprod];
go

/* create tables */
create table [cnldev].[datagroup](
	[DataGroupId] [int] identity not null,
	[DataGroupTypeId] [int] not null,
	[Name] [nvarchar](500) not null,
	constraint [PK_datagroup_DataGroupId] primary key clustered 
	(
		[DataGroupId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary],
	constraint [ux_datagroup_name] unique nonclustered
	(
		[Name] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

create table [cnldev].[datagrouptype](
	[DataGroupTypeId] [int] identity not null,
	[Name] [nvarchar](50) null,
	[Description] [nvarchar](1000) null,
	constraint [PK_datagrouptype_DataGroupTypeId] primary key clustered 
	(
		[DataGroupTypeId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary],
	constraint [ux_datagrouptype_name] unique nonclustered
	(
		[Name] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

create table [cnldev].[dataitem](
	[DataItemId] [int] identity not null,
	[DataItemTypeId] [int] not null,
	[DataGroupId] [int] not null,
	[Text] [nvarchar](2000) not null,
	[Ordinal] [int] not null,
	[Allownulls] [bit] null,
	constraint [PK_dataitem_DataItemId] primary key clustered 
	(
		[DataItemId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

alter table [cnldev].[dataitem] add default 1 for [Allownulls];
go

create table [cnldev].[dataitembit](
	[DataItemBitId] [int] identity not null,
	[DataItemId] [int] null,
	constraint [PK_dataitembit_DataItemBitId] primary key clustered 
	(
		[DataItemBitId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

create table [cnldev].[dataitemdate](
	[DataItemDateId] [int] identity not null,
	[DataItemId] [int] null,
	[MinDate] [date] null,
	[MaxDate] [date] null,
	constraint [PK_dataitemdate_DataItemDateId] primary key clustered 
	(
		[DataItemDateId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

create table [cnldev].[dataitemdecimal](
	[DataItemDecimalId] [int] identity not null,
	[DataItemId] [int] null,
	[Precision] [smallint] null,
	[Scale] [smallint] null,
	[IsCalculated] [binary] null,
	constraint [PK_dataitemdecimal_DataItemDecimalId] primary key clustered 
	(
		[DataItemDecimalId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

alter table [cnldev].[dataitemdecimal] add default 0 for [IsCalculated];
go

create table [cnldev].[dataiteminteger](
	[DataItemIntegerId] [int] identity not null,
	[DataItemId] [int] null,
	[MinValue] [int] null,
	[MaxValue] [int] null,
	[IsCalculated] [binary] null,
	constraint [PK_dataiteminteger_DataItemIntegerId] primary key clustered 
	(
		[DataItemIntegerId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

alter table [cnldev].[dataiteminteger] add default 0 for [IsCalculated];
go

create table [cnldev].[dataitemtext](
	[DataItemTextId] [int] identity not null,
	[DataItemId] [int] null,
	[MaxLength] [int] null,
	[AllowTruncation] [binary] null,
	constraint [PK_dataitemtext_DataItemTextId] primary key clustered 
	(
		[DataItemTextId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

alter table [cnldev].[dataitemtext] add default 0 for [AllowTruncation];
go

create table [cnldev].[dataitemtype](
	[DataItemTypeId] [int] identity not null,
	[Name] [nvarchar](50) null,
	[Description] [nvarchar](1000) null,
	constraint [PK_dataitemtype_DataItemTypeId] primary key clustered 
	(
		[DataItemTypeId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary],
	constraint [ux_dataitemtype_name] unique nonclustered
	(
		[Name] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

create table [cnldev].[logentrytype](
	[LogEntryTypeId] [int] identity not null,
	[Name] [nvarchar](50) null,
	[Description] [nvarchar](1000) null,
	constraint [PK_logentrytype_LogEntryTypeId] primary key clustered 
	(
		[LogEntryTypeId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary],
	constraint [ux_logentrytype_name] unique nonclustered
	(
		[Name] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

create table [cnldev].[responsedefinition](
	[ResponseDefinitionId] [int] identity not null,
	[ResponseDefinitionName] [nvarchar](500) null,
	constraint [PK_responsedefinition_ResponseDefinitionId] primary key clustered 
	(
		[ResponseDefinitionId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary],
	constraint [ux_responsedefinition_responsedefinitionname] unique nonclustered
	(
		[ResponseDefinitionName] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

create table [cnldev].[responsedefinitionitem](
	[ResponseDefinitionItemId] [int] identity not null,
	[ResponseDefinitionId] [int] not null,
	[ResponseDefinitionItemKey] [nvarchar](500) null,
	[ResponseDefinitionItemValue] [nvarchar](500) null,
	constraint [PK_responsedefinitionitem_ResponseDefinitionItemId] primary key clustered 
	(
		[ResponseDefinitionItemId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary],
	constraint [ux_responsedefinitionitem_responsedefinitionitemid_responsedefinitionitemkey] unique nonclustered
	(
		[ResponseDefinitionItemId] asc,
		[ResponseDefinitionItemKey] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

create table [cnldev].[study](
	[StudyId] [int] identity not null,
	[Name] [nvarchar](1000) not null,
	[Abbreviation] [nvarchar](50) not null,
	constraint [PK_study_StudyId] primary key clustered 
	(
		[StudyId] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary];
go

/* Tables: Add Foreign Key Constraints */

alter table [cnldev].[datagroup] with check add constraint [fk_datagroup_datagrouptype] foreign key([DataGroupTypeId]) references [cnldev].[datagrouptype] ([DataGroupTypeId]);
go

alter table [cnldev].[dataitem] with check add constraint [fk_dataitem_dataitemtype] foreign key([DataItemTypeId]) references [cnldev].[dataitemtype] ([DataItemTypeId]);
go

alter table [cnldev].[dataitem] with check add constraint [fk_dataitem_datagroup] foreign key([DataGroupId]) references [cnldev].[datagroup] ([DataGroupId]);
go

alter table [cnldev].[dataitembit] with check add constraint [fk_dataitembit_dataitembit] foreign key([DataItemId]) references [cnldev].[dataitem] ([DataItemId]);
go

alter table [cnldev].[dataitembit] with check add constraint [fk_dataitembit_dataitem] foreign key([DataItemId]) references [cnldev].[dataitem] ([DataItemId]);
go

alter table [cnldev].[dataitemdate] with check add constraint [fk_dataitemdate_dataitem] foreign key([DataItemId]) references [cnldev].[dataitem] ([DataItemId]);
go

alter table [cnldev].[dataitemdecimal] with check add constraint [fk_dataitemdecimal_dataitem] foreign key([DataItemId]) references [cnldev].[dataitem] ([DataItemId]);
go

alter table [cnldev].[dataiteminteger] with check add constraint [fk_dataiteminteger_dataitem] foreign key([DataItemId]) references [cnldev].[dataitem] ([DataItemId]);
go

alter table [cnldev].[dataitemtext] with check add constraint [fk_dataitemtext_dataitem] foreign key([DataItemId]) references [cnldev].[dataitem] ([DataItemId]);
go

alter table [cnldev].[responsedefinitionitem] with check add constraint [fk_responsedefinitionitem_responsedefinition] foreign key([ResponseDefinitionId]) references [cnldev].[responsedefinition] ([ResponseDefinitionId]);
go

/* Views: Create */

create view [cnldev].[datagroups] (
	[DataGroupTypeId], 
	[DataGroupType], 
	[DataGroupId], 
	[Name])
as 
	select 
		dgt.DataGroupTypeId as DataGroupTypeId
		,dgt.[Name] as DataGroupType
		,dg.DataGroupId as DataGroupId
		,dg.[Name] as [Name]
	from cnldev.datagroup dg 
		join cnldev.datagrouptype dgt 
			on dg.DataGroupTypeId = dgt.DataGroupTypeId;
go

create view [cnldev].[dataitembits] (
	[dataitemid], 
	[dataitemtypeid], 
	[dataitembitid], 
	[datagroupid], 
	[text], 
	[ordinal], 
	[allownulls])
as 
	select
		di.DataItemId as dataitemid 
		,di.DataItemTypeId as dataitemtypeid 
		,dib.DataItemBitId as dataitembitid 
		,di.DataGroupId as datagroupid 
		,di.[Text] as [text] 
		,di.Ordinal as ordinal 
		,di.Allownulls as allownulls
	from cnldev.dataitem di 
		join cnldev.dataitembit dib 
			on di.DataItemId = dib.DataItemId;
go

create view [cnldev].[dataitemdates] (
	[dataitemid], 
	[dataitemdateid], 
	[dataitemtypeid], 
	[datagroupid], 
	[text], 
	[ordinal], 
	[allownulls], 
	[mindate], 
	[maxdate])
as 
	select
		di.DataItemId as dataitemid 
		,did.DataItemDateId as dataitemdateid 
		,di.DataItemTypeId as dataitemtypeid 
		,di.DataGroupId as datagroupid 
		,di.[Text] as [text] 
		,di.Ordinal as ordinal 
		,di.Allownulls as allownulls 
		,did.MinDate as mindate 
		,did.MaxDate as maxdate
	from cnldev.dataitem di 
		join cnldev.dataitemdate did 
			on di.DataItemId = did.DataItemId;
go

create view [cnldev].[dataitemdecimals] (
	[dataitemid], 
	[dataitemdecimalid], 
	[dataitemtypeid], 
	[datagroupid], 
	[text], 
	[ordinal], 
	[allownulls], 
	[precision], 
	[scale], 
	[iscalculated])
as 
	select
		di.DataItemId as dataitemid 
		,did.DataItemDecimalId as dataitemdecimalid 
		,di.DataItemTypeId as dataitemtypeid 
		,di.DataGroupId as datagroupid 
		,di.[Text] as [text] 
		,di.Ordinal as ordinal 
		,di.AllowNulls as allownulls 
		,did.[Precision] as [precision] 
		,did.Scale as scale 
		,did.IsCalculated as iscalculated
	from cnldev.dataitem di 
		join cnldev.dataitemdecimal did 
			on di.DataItemId = did.DataItemId
go

create view [cnldev].[dataitemintegers] (
	[dataitemid], 
	[dataitemintegerid], 
	[dataitemtypeid], 
	[datagroupid], 
	[text], 
	[ordinal], 
	[allownulls], 
	[iscalculated], 
	[minvalue], 
	[maxvalue])
as 
	select
		di.DataItemId as dataitemid 
		,dii.DataItemIntegerId as dataitemintegerid 
		,di.DataItemTypeId as dataitemtypeid 
		,di.DataGroupId as datagroupid 
		,di.[Text] as [text] 
		,di.Ordinal as ordinal 
		,di.Allownulls as allownulls 
		,dii.IsCalculated as iscalculated 
		,dii.MinValue as minvalue 
		,dii.MaxValue as maxvalue
	from cnldev.dataitem di 
		join cnldev.dataiteminteger dii 
			on di.DataItemId = dii.DataItemId
go

create view [cnldev].[dataitemtexts] (
	[dataitemid], 
	[dataitemtextid], 
	[dataitemtypeid], 
	[datagroupid], 
	[text], 
	[ordinal], 
	[allownulls], 
	[maxlength], 
	[allowtruncation])
as 
	select
		di.DataItemId as dataitemid 
		,dit.DataItemTextId as dataitemtextid 
		,di.DataItemTypeId as dataitemtypeid 
		,di.DataGroupId as datagroupid 
		,di.[Text] as [text] 
		,di.Ordinal as ordinal 
		,di.Allownulls as allownulls 
		,dit.[MaxLength] as [maxlength] 
		,dit.AllowTruncation as allowtruncation
	from cnldev.dataitem di 
		join cnldev.dataitemtext dit 
			on di.DataItemId = dit.DataItemId
go