// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Base64.sol";

/**
 * @title OnChain metadata builder
 * @author Mickaël BIGANT
 * @dev Provides a set of functions to generate onchain metadatas following OpenSea specs.
 * @notice See OpenSea specifications here : https://docs.opensea.io/docs/metadata-standards
 */
library OSMetadataBuilder {

    string public constant VALUE_ATTRIBUTE_DISPLAY_BOOST_NUMBER = "boost_number";
    string public constant VALUE_ATTRIBUTE_DISPLAY_BOOST_PERCENT = "boost_percentage";
    string public constant VALUE_ATTRIBUTE_DISPLAY_NUMBER = "number";
    string public constant VALUE_ATTRIBUTE_DISPLAY_DATE = "date";

    struct Metadata {
        string name;
        string description;
        string externalUrl;
        string image;
        string backgroundColor;
        string youtubeUrl;
        string animationUrl;
    }

    struct Attribute {
        string traitType;
        string value;
        string displayType;
        uint256 maxValue;
    }

    function buildBase64Metadata( Metadata memory _metadata, Attribute[] memory _attributes ) internal pure returns (string memory) {
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode( bytes(buildMetadata(_metadata, _attributes)) )
            )
        );
    }

    function buildMetadata( Metadata memory _metadata, Attribute[] memory _attributes ) internal pure returns (string memory) {

        return string(
            abi.encodePacked(
                '{',
                getDescription(_metadata),
                getName(_metadata),
                getExternalUrl(_metadata),
                getImage(_metadata),
                getBgColor(_metadata),
                getAnimationUrl(_metadata),
                getYoutubeUrl(_metadata),
                getAttributes(_attributes),
                '}'
            )
        );
    }

    function getDescription(Metadata memory _metadata) internal pure returns( string memory ) {
        return string(abi.encodePacked('"description":', abi.encodePacked('"', _metadata.description ,'"', ',')));
    }

    function getName(Metadata memory _metadata) internal pure returns( string memory ) {
        return string(abi.encodePacked('"name":', abi.encodePacked('"', _metadata.name ,'"', ',')));
    }

    function getExternalUrl(Metadata memory _metadata) internal pure returns( string memory ) {
        return string(abi.encodePacked('"external_url":', abi.encodePacked('"', _metadata.externalUrl ,'"', ',')));
    }

    function getImage(Metadata memory _metadata) internal pure returns( string memory ) {
        return string(abi.encodePacked('"image":', abi.encodePacked('"', _metadata.image ,'"', ',')));
    }

    function getBgColor(Metadata memory _metadata) internal pure returns( string memory ) {
        return string(abi.encodePacked('"background_color":', abi.encodePacked('"', _metadata.backgroundColor ,'"', ',')));
    }

    function getAnimationUrl(Metadata memory _metadata) internal pure returns( string memory ) {
        return string(abi.encodePacked('"animation_url":', abi.encodePacked('"', _metadata.animationUrl ,'"', ',')));
    }

    function getYoutubeUrl(Metadata memory _metadata) internal pure returns( string memory ) {
        return string(abi.encodePacked('"youtube_url":', abi.encodePacked('"', _metadata.youtubeUrl ,'"', ',')));
    }

    function getAttributes(Attribute[] memory _attributes) internal pure returns( string memory ) {
        return string(abi.encodePacked('"attributes":', buildAttributes(_attributes)));
    }

    function buildAttributes( Attribute[] memory _attributes ) private pure returns (string memory) {

        string memory attributesString = "[";

        for( uint i = 0; i < _attributes.length; i++ ) {
            attributesString = string(
                abi.encodePacked( attributesString, i == 0 ? '' : ',', buildAttribute(_attributes[i]) )
            );
        }

        return string( abi.encodePacked(attributesString, ']') );
    }

    function buildAttribute( Attribute memory _attribute ) private pure returns (string memory) {

        if( isEmpty(_attribute.traitType) || isEmpty(_attribute.value) ) {
            return "";
        }

        bytes memory attribute = abi.encodePacked(
            '{',
                '"trait_type":', '"', _attribute.traitType ,'"', ',',
                '"value":', '"', _attribute.value ,'"',
                isEmpty(_attribute.displayType) ? '' : string( abi.encodePacked(',', '"display_type":', '"', _attribute.displayType,'"')),
                _attribute.maxValue == 0 ? '' : string( abi.encodePacked(',', '"max_value":', toString(_attribute.maxValue))),
            '}'
        );

        return string(attribute);
    }

    function isEmpty( string memory str ) private pure returns (bool) {
        return keccak256(abi.encode(str)) == keccak256(abi.encode(""));
    }

    function toString(uint256 value) internal pure returns (string memory) {

        if (value == 0) {
            return "0";
        }

        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}