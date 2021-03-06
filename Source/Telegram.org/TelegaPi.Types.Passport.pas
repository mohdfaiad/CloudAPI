{***************************************************************************}
{                                                                           }
{           CloudApi for Delphi                                             }
{                                                                           }
{           Copyright (c) 2014-2018 Maxim Sysoev                            }
{                                                                           }
{           https://t.me/CloudAPI                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}

unit TelegaPi.Types.Passport;

interface

uses
  TelegaPi.Types.Enums;

type
  ItgPersonalDetails = interface
    ['{F77CD641-E826-40C2-B0C3-4EFBB6779555}']
    function FirstName: string;
    function LastName: string;
    function BirthDate: TDate;
    function Gender: TtgGender;
    function CountryCode: string;
    function ResidenceCountryCode: string;
  end;

  ItgResidentialAdress = interface
    ['{C7738CB9-9D6C-4635-9E78-657435238F76}']
    function StreetLine1: string;
    function StreetLine2: string;
    function City: string;
    function State: string;
    function CountryCode: string;
    function PostCode: string;
  end;

  ItgIdDocumentData = interface
    ['{DF2A60A9-7D1D-424F-9001-D7F9E6390D1F}']
    function DocumentNo: string;
    function ExpiryDate: TDate;
  end;

implementation

end.

