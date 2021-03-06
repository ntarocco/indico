<%page args="room=None"/>
  <!-- ROOM -->
  <tr>
    <td>
        <div class="groupTitle bookingTitle">${'Room Details'}</div>
    </td>
  </tr>
  <tr>
    <td>
        <table>
            <tr>
                <td class="subFieldWidth" align="right" valign="top">${ _("Name")}&nbsp;&nbsp;</td>
                <td align="left" class="blacktext">
                % if infoBookingMode:
                    <a href="${ roomDetailsUH.getURL( room ) }">${ room.building }-${ room.floor }-${ room.roomNr }
                        % if room.name != str(room.building) + '-' + str(room.floor) + '-' + str(room.roomNr):
                           (${ room.name })
                        % endif
                % else:
                    <select name="roomName" id="roomName" onchange="isBookable()" style="width:220px">
                    % for roomItem in rooms:
                      <% selected = "" %>
                      % if room.name == roomItem.name:
                        <% selected = 'selected="selected"' %>
                      % endif
                      <option data-location="${roomItem.locationName}" data-id="${roomItem.id}" ${ selected } class="${roomClass( roomItem )}">${ roomItem.locationName + ": &nbsp; " + roomItem.getFullName() }</option>
                    % endfor
                    </select>
                    <a target="_blank" href="${roomDetailsUH.getURL( room )}">${ _("Full details")}</a>
                % endif
                </td>
            </tr>
            % if room.photoId != None:
            <tr>
                <td class="subFieldWidth" align="right" valign="top"> ${ _("Interior")}&nbsp;&nbsp;</td>
                <td align="left" class="thumbnail">
                    <a href="${ room.getPhotoURL() }" rel="lightbox" title="${ room.photoId }">
                        <img border="1px" src="${ room.getSmallPhotoURL() }" alt="${ str( room.photoId ) }"/>
                    </a>
                </td>
            </tr>
            % endif
            % if room.capacity:
            <tr>
                <td class="subFieldWidth" align="right" valign="top"> ${ _("Capacity")}&nbsp;&nbsp;</td>
                <td align="left" class="blacktext">${ room.capacity }&nbsp;${_("people")}</td>
            </tr>
            % endif
            % if room.whereIsKey:
            <tr>
                <td class="subFieldWidth" align="right" valign="top"> ${ _("Room key")}&nbsp;&nbsp;</td>
                <td align="left" class="blacktext">${ room.whereIsKey }${contextHelp('whereIsKeyHelp' )}</td>
            </tr>
            % endif
            % if room.comments:
            <tr>
                <td class="subFieldWidth" align="right" valign="top"> ${ _("Comments")}&nbsp;&nbsp;</td>
                <td align="left" class="blacktext">${ room.comments }</td>
            </tr>
            % endif
        </table>
    </td>
  </tr>
