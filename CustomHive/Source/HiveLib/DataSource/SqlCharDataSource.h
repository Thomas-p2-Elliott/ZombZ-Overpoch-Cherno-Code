/*
* Copyright (C) 2009-2012 Rajko Stojadinovic <http://github.com/rajkosto/hive>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

#pragma once

#include "SqlDataSource.h"
#include "CharDataSource.h"
#include "Database/SqlStatement.h"

class SqlCharDataSource : public SqlDataSource, public CharDataSource
{
public:
	SqlCharDataSource(Poco::Logger& logger, shared_ptr<Database> db, const string& idFieldName, const string& wsFieldName);
	~SqlCharDataSource();

	Sqf::Value fetchCharacterInitial( string playerId, int serverId, const string& playerName ) override;
	Sqf::Value fetchPackages( string playerId, int serverId ) override;
	Sqf::Value fetchCharacterDetails( int characterId ) override;
	Sqf::Value fetchTraderObject( int traderObjectId, int action) override;
	bool updateMorality(string playerUID, int morality) override;
	bool updateDebugMonSettings(string playerUID, const Sqf::Value& debugMonSettings) override;
	bool claimPackage(string playerUID, const Sqf::Value& packageArray) override;

	bool updateCharacter( int characterId, int serverId, const FieldsType& fields ) override;
	bool initCharacter( int characterId, const Sqf::Value& inventory, const Sqf::Value& backpack ) override;
	bool killCharacter( int characterId, int duration, int infected ) override;
	bool recordLogin( string playerId, int characterId, int action ) override;

private:
	string _idFieldName;
	string _wsFieldName;

	//statement ids
	SqlStatementID _stmtChangePlayerName;
	SqlStatementID _stmtInsertPlayer;
	SqlStatementID _stmtUpdateCharacterLastLogin;
	SqlStatementID _stmtInsertNewCharacter;
	SqlStatementID _stmtInitCharacter;
	SqlStatementID _stmtChangePlyrSetting;
	SqlStatementID _stmtKillCharacter;
	SqlStatementID _stmtupdateDebugMonSettings;
	SqlStatementID _stmtClaimPackage;
	SqlStatementID _stmtUpdateMorality;
	SqlStatementID _stmtRecordLogin;
	SqlStatementID _stmtTradeObjectBuy;
	SqlStatementID _stmtTradeObjectSell;
};