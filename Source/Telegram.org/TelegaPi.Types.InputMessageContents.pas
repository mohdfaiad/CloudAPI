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

unit TelegaPi.Types.InputMessageContents;

interface

uses
  REST.Json.Types;

type
  /// <summary>
  ///   This object represents the content of a message to be sent as a result
  ///   of an inline query.
  /// </summary>
  TtgInputMessageContent = class(TObject);

  /// <summary>
  ///   Represents the content of a contact message to be sent as the result of
  ///   an inline query.
  /// </summary>
  TtgInputContactMessageContent = class(TtgInputMessageContent)
  public
    /// <summary>
    ///   Contact's phone number
    /// </summary>
    [JSONName('phone_number')]
    PhoneNumber: string;
    /// <summary>
    ///   Contact's first name
    /// </summary>
    [JSONName('first_name')]
    FirstName: string;
    /// <summary>
    ///   Optional. Contact's last name
    /// </summary>
    [JSONName('last_name')]
    LastName: string;
    [JSONName('vCard')]
    vCard: string;
    constructor Create(const APhoneNumber, AFirstName: string; ALastName: string = ''; AvCard: string = '');
  end;

  /// <summary>
  ///   Represents the content of a location message to be sent as the result
  ///   of an inline query.
  /// </summary>
  TtgInputLocationMessageContent = class(TtgInputMessageContent)
  public
    /// <summary>
    ///   Latitude of the location in degrees
    /// </summary>
    [JSONName('latitude')]
    Latitude: Single;
    /// <summary>
    ///   Longitude of the location in degrees
    /// </summary>
    [JSONName('longitude')]
    Longitude: Single;
    constructor Create(ALatitude, ALongitude: Single);
  end;

  /// <summary>
  ///   Represents the content of a text message to be sent as the result of an
  ///   inline query.
  /// </summary>
  TtgInputTextMessageContent = class(TtgInputMessageContent)
  public
    /// <summary>
    ///   Text of the message to be sent, 1-4096 characters
    /// </summary>
    [JSONName('message_text')]
    MessageText: string;
    /// <summary>
    ///   Optional. Send Markdown or HTML, if you want Telegram apps to show
    ///   bold, italic, fixed-width text or inline URLs in your bot's message.
    /// </summary>
    [JSONName('parse_mode')]
    ParseMode: string;
    /// <summary>
    ///   Optional. Disables link previews for links in the sent message
    /// </summary>
    [JSONName('disable_web_page_preview')]
    DisableWebPagePreview: Boolean;
    constructor Create(const AMessageText, AParseMode: string; ADisableWebPagePreview: Boolean);
  end;

  /// <summary>
  ///   Represents the content of a venue message to be sent as the result of
  ///   an inline query.
  /// </summary>
  TtgInputVenueMessageContent = class(TtgInputMessageContent)
  public
    /// <summary>
    ///   Latitude of the venue in degrees
    /// </summary>
    [JSONName('latitude')]
    Latitude: Single;
    /// <summary>
    ///   Longitude of the venue in degrees
    /// </summary>
    [JSONName('longitude')]
    Longitude: Single;
    /// <summary>
    ///   Name of the venue
    /// </summary>
    [JSONName('title')]
    Title: string;
    /// <summary>
    ///   Address of the venue
    /// </summary>
    [JSONName('address')]
    Address: string;
    /// <summary>
    ///   Optional. Foursquare identifier of the venue, if known
    /// </summary>
    [JSONName('foursquare_id')]
    FoursquareId: string;
    [JSONName('foursquare_type')]
    FoursquareType: string;
    constructor Create(ALatitude, ALongitude: Single; const ATitle, AAddress: string; const AFoursquareId: string = '';
      const AFoursquareType: string = '');
  end;

implementation

{ TtgInputTextMessageContent }

constructor TtgInputTextMessageContent.Create(const AMessageText, AParseMode: string; ADisableWebPagePreview: Boolean);
begin
  inherited Create;
  MessageText := AMessageText;
  ParseMode := AParseMode;
  DisableWebPagePreview := ADisableWebPagePreview;
end;

{ TtgInputLocationMessageContent }

constructor TtgInputLocationMessageContent.Create(ALatitude, ALongitude: Single);
begin
  inherited Create;
  Latitude := ALatitude;
  Longitude := ALongitude;
end;

{ TtgInputVenueMessageContent }

constructor TtgInputVenueMessageContent.Create(ALatitude, ALongitude: Single;
  const ATitle, AAddress, AFoursquareId, AFoursquareType: string);
begin
  inherited Create;
  Latitude := ALatitude;
  Longitude := ALongitude;
  Title := ATitle;
  Address := AAddress;
  FoursquareId := AFoursquareId;
  FoursquareType := AFoursquareType;
end;

{ TtgInputContactMessageContent }

constructor TtgInputContactMessageContent.Create(const APhoneNumber, AFirstName: string; ALastName, AvCard: string);
begin
  inherited Create;
  PhoneNumber := APhoneNumber;
  FirstName := AFirstName;
  LastName := ALastName;
  vCard := AvCard;
end;

end.
