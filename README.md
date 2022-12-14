# OpenSea Metadata Builder
Solidity library for building onchain metadatas following OpenSea specifications

## Installation

```bash
npm i @zerohix/opensea-metadata-lib
```

## Usage

```solidity
import "@zerohix/opensea-metadata-lib/OSMetadataBuilder.sol";
```

## Methods

- buildMetadata()

Return the basic json version of the metadata as string


- buildBase64Metadata()

Return the base64 encoded metadata as string

## Example

```solidity
import "@zerohix/opensea-metadata-lib/OSMetadataBuilder.sol";

function tokenURI() public pure returns(string memory) {
    
    OSMetadataBuilder.Metadata memory metadata;
    metadata.name = "My NFT";
    metadata.description = "My First NFT !";
    metadata.image = "https://storage.googleapis.com/opensea-prod.appspot.com/puffs/3.png";
    //Or Base64 encoded image
    //metadata.image = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiCgkgdmlld0JveD0iMCAwIDUwOCA1MDgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUwOCA1MDg7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGNpcmNsZSBzdHlsZT0iZmlsbDojRkQ4NDY5OyIgY3g9IjI1NCIgY3k9IjI1NCIgcj0iMjU0Ii8+CjxnPgoJCgkJPGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoMC42NTcxIC0wLjc1MzggMC43NTM4IDAuNjU3MSAtMjcuMjIxOCAzOTMuMDg3MikiIHN0eWxlPSJmaWxsOiMyQjNCNEU7IiBjeD0iNDE4LjQ1NiIgY3k9IjIyNi40NjUiIHJ4PSI2NiIgcnk9IjQzLjYiLz4KCQoJCTxlbGxpcHNlIHRyYW5zZm9ybT0ibWF0cml4KDAuNjU3MSAwLjc1MzggLTAuNzUzOCAwLjY1NzEgMjAxLjUyNjkgOS45ODMyKSIgc3R5bGU9ImZpbGw6IzJCM0I0RTsiIGN4PSI4OS43OSIgY3k9IjIyNi41MDIiIHJ4PSI2NiIgcnk9IjQzLjYiLz4KPC9nPgo8cGF0aCBzdHlsZT0iZmlsbDojRTZFOUVFOyIgZD0iTTI1NCw3OS42Yy01Mi40LDAtOTguNCwxNS42LTEyNi40LDQ3LjZ2MTgyYzI4LDQ4LjgsNzQuNCw4Ni40LDEyNi40LDg2LjQKCWM1OS42LDAsMTExLjItNDguNCwxMzcuMi0xMDcuMlYxNDEuNkMzNjUuMiw5OS42LDMxMy42LDc5LjYsMjU0LDc5LjZ6Ii8+CjxwYXRoIHN0eWxlPSJmaWxsOiMzMjRBNUU7IiBkPSJNNDYxLjYsMTc2LjhjLTEzLjItMTEuNi0zNS4yLTkuNi01NS42LDMuMmMtMTMuNi02OC03Ni40LTEwMC44LTE1Mi0xMDAuOFMxMTUuNiwxMTIsMTAyLDE4MAoJYy0yMC40LTEyLjgtNDItMTQuOC01NS42LTMuMmMtMTEuNiwxMC0xNCwyNy42LTcuNiw0Ni40YzAuOC04LjgsNC0xNi44LDEwLjQtMjJjMTItMTAuNCwzMS42LTkuMiw1MC40LDEuNmMwLDIsMCw0LDAsNgoJYzAsNTIsMjQuNCwxMDguNCw2Mi40LDE0NS42Yy0zLjYtNi44LTcuMi0xNC0xMC40LTIyYy0yOS4yLTcwLjgtMjYtMTU1LjYsMTYuNC0xNzIuNGMyOC40LTExLjIsNjIsMTUuNiw4Niw2MC40CgljMjMuNi00NC44LDU3LjYtNzIsODYuNC02MC40YzQyLjQsMTYuOCw0NS42LDEwMS42LDE2LjQsMTcyLjRjLTMuMiw4LTYuOCwxNS4yLTEwLjQsMjJjMzgtMzcuMiw2Mi44LTkzLjYsNjIuOC0xNDUuNmMwLTIsMC00LDAtNgoJYzE4LjQtMTAuOCwzOC40LTEyLjQsNTAuNC0xLjZjNi40LDUuNiw5LjYsMTMuMiwxMC40LDIyQzQ3NS42LDIwNC40LDQ3My4yLDE4Ni44LDQ2MS42LDE3Ni44eiIvPgo8ZWxsaXBzZSBzdHlsZT0iZmlsbDojRkZGRkZGOyIgY3g9IjI1NCIgY3k9IjM1My42IiByeD0iMTAzLjYiIHJ5PSI3NC44Ii8+CjxjaXJjbGUgc3R5bGU9ImZpbGw6IzMyNEE1RTsiIGN4PSIzMDYuOCIgY3k9IjIzNy42IiByPSIxOC40Ii8+CjxlbGxpcHNlIHRyYW5zZm9ybT0ibWF0cml4KDAuNjE5MyAtMC43ODUxIDAuNzg1MSAwLjYxOTMgLTY4Ljc5NDIgMzIxLjg4MDQpIiBzdHlsZT0iZmlsbDojRkZGRkZGOyIgY3g9IjI5Ny41NCIgY3k9IjIzMS44ODQiIHJ4PSI1LjIiIHJ5PSIyLjQiLz4KPGNpcmNsZSBzdHlsZT0iZmlsbDojMzI0QTVFOyIgY3g9IjE5Ni40IiBjeT0iMjM3LjYiIHI9IjE4LjQiLz4KPGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoMC42MTkzIC0wLjc4NTEgMC43ODUxIDAuNjE5MyAtMTEwLjc3MyAyMzUuMjIyMikiIHN0eWxlPSJmaWxsOiNGRkZGRkY7IiBjeD0iMTg3LjE4NSIgY3k9IjIzMS44NDUiIHJ4PSI1LjIiIHJ5PSIyLjQiLz4KPGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojRTZFOUVFOyIgZD0iTTE1NCwzNzIuOGMyNC44LDExLjYsNjAsMTkuMiwxMDAsMTkuMnM3NS4yLTcuMiwxMDAtMTkuMmMyLTUuMiwzLjItMTAuOCwzLjItMTYuNAoJCWMtMjAuNCwxMi01NC40LDIxLjYtOTYuOCwyMi40VjM0MGgtMTIuOHYzOC44Yy00Mi40LTAuOC03Ni40LTEwLjQtOTYuOC0yMi40QzE1MC44LDM2MiwxNTIsMzY3LjYsMTU0LDM3Mi44eiIvPgoJPHBhdGggc3R5bGU9ImZpbGw6I0U2RTlFRTsiIGQ9Ik0yODgsMzI3LjZjMCw4LjgtMTUuMiwzMi0zNCwzMnMtMzQtMjMuMi0zNC0zMnMxNS4yLTE2LDM0LTE2UzI4OCwzMTguOCwyODgsMzI3LjZ6Ii8+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+"
    metadata.externalUrl = "https://docs.opensea.io/docs/metadata-standards";

    OSMetadataBuilder.Attribute[] memory attributes = new OSMetadataBuilder.Attribute[](6);
    attributes[0] = OSMetadataBuilder.Attribute("Birthday", "1651615200", OSMetadataBuilder.VALUE_ATTRIBUTE_DISPLAY_DATE, 0);
    attributes[1] = OSMetadataBuilder.Attribute("Power", "100", "", 0);
    attributes[2] = OSMetadataBuilder.Attribute("Stamina", "30", OSMetadataBuilder.VALUE_ATTRIBUTE_DISPLAY_BOOST_NUMBER, 0);
    attributes[3] = OSMetadataBuilder.Attribute("Mana", "76", OSMetadataBuilder.VALUE_ATTRIBUTE_DISPLAY_BOOST_PERCENT, 0);
    attributes[4] = OSMetadataBuilder.Attribute("LVL", "4", OSMetadataBuilder.VALUE_ATTRIBUTE_DISPLAY_NUMBER, 10);
    attributes[5] = OSMetadataBuilder.Attribute("Version", "2", OSMetadataBuilder.VALUE_ATTRIBUTE_DISPLAY_NUMBER, 5);

    return OSMetadataBuilder.buildBase64Metadata(m, attributes);
}
```

## Results

### Calling buildMetadata()

```json
{
  "description": "This is my NFY !!",
  "name": "My NFT",
  "external_url": "https://docs.opensea.io/docs/metadata-standards",
  "image": "https://storage.googleapis.com/opensea-prod.appspot.com/puffs/5.png",
  "background_color": "",
  "animation_url": "",
  "youtube_url": "",
  "attributes": [
    {
      "trait_type": "Power",
      "value": "100"
    },
    {
      "trait_type": "Birthday",
      "value": "1658921342",
      "display_type": "date"
    },
    {
      "trait_type": "Stamina",
      "value": "30",
      "display_type": "boost_number"
    },
    {
      "trait_type": "Mana",
      "value": "30",
      "display_type": "boost_percentage"
    },
    {
      "trait_type": "LVL",
      "value": "4",
      "display_type": "number",
      "max_value": 10
    },
    {
      "trait_type": "Version",
      "value": "2",
      "display_type": "number",
      "max_value": 5
    }
  ]
}
```

### Calling buildBase64Metadata()

```
data:application/json;base64,eyJkZXNjcmlwdGlvbiI6IlRoaXMgaXMgbXkgTkZZICEhIiwibmFtZSI6Ik15IE5GVCIsImV4dGVybmFsX3VybCI6Imh0dHBzOi8vZG9jcy5vcGVuc2VhLmlvL2RvY3MvbWV0YWRhdGEtc3RhbmRhcmRzIiwiaW1hZ2UiOiJodHRwczovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vb3BlbnNlYS1wcm9kLmFwcHNwb3QuY29tL3B1ZmZzLzUucG5nIiwiYmFja2dyb3VuZF9jb2xvciI6IiIsImFuaW1hdGlvbl91cmwiOiIiLCJ5b3V0dWJlX3VybCI6IiIsImF0dHJpYnV0ZXMiOlt7InRyYWl0X3R5cGUiOiJQb3dlciIsInZhbHVlIjoiMTAwIn0seyJ0cmFpdF90eXBlIjoiQmlydGhkYXkiLCJ2YWx1ZSI6IjE2NTg5MjEzNDIiLCJkaXNwbGF5X3R5cGUiOiJkYXRlIn0seyJ0cmFpdF90eXBlIjoiU3RhbWluYSIsInZhbHVlIjoiMzAiLCJkaXNwbGF5X3R5cGUiOiJib29zdF9udW1iZXIifSx7InRyYWl0X3R5cGUiOiJNYW5hIiwidmFsdWUiOiIzMCIsImRpc3BsYXlfdHlwZSI6ImJvb3N0X3BlcmNlbnRhZ2UifSx7InRyYWl0X3R5cGUiOiJMVkwiLCJ2YWx1ZSI6IjQiLCJkaXNwbGF5X3R5cGUiOiJudW1iZXIiLCJtYXhfdmFsdWUiOjEwfSx7InRyYWl0X3R5cGUiOiJWZXJzaW9uIiwidmFsdWUiOiIyIiwiZGlzcGxheV90eXBlIjoibnVtYmVyIiwibWF4X3ZhbHVlIjo1fV19
```

## Fully onChain metadata

For a fully onChain NFT, you can set the image as base64 encoded string.

```solidity
metadata.image = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiCgkgdmlld0JveD0iMCAwIDUwOCA1MDgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUwOCA1MDg7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGNpcmNsZSBzdHlsZT0iZmlsbDojRkQ4NDY5OyIgY3g9IjI1NCIgY3k9IjI1NCIgcj0iMjU0Ii8+CjxnPgoJCgkJPGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoMC42NTcxIC0wLjc1MzggMC43NTM4IDAuNjU3MSAtMjcuMjIxOCAzOTMuMDg3MikiIHN0eWxlPSJmaWxsOiMyQjNCNEU7IiBjeD0iNDE4LjQ1NiIgY3k9IjIyNi40NjUiIHJ4PSI2NiIgcnk9IjQzLjYiLz4KCQoJCTxlbGxpcHNlIHRyYW5zZm9ybT0ibWF0cml4KDAuNjU3MSAwLjc1MzggLTAuNzUzOCAwLjY1NzEgMjAxLjUyNjkgOS45ODMyKSIgc3R5bGU9ImZpbGw6IzJCM0I0RTsiIGN4PSI4OS43OSIgY3k9IjIyNi41MDIiIHJ4PSI2NiIgcnk9IjQzLjYiLz4KPC9nPgo8cGF0aCBzdHlsZT0iZmlsbDojRTZFOUVFOyIgZD0iTTI1NCw3OS42Yy01Mi40LDAtOTguNCwxNS42LTEyNi40LDQ3LjZ2MTgyYzI4LDQ4LjgsNzQuNCw4Ni40LDEyNi40LDg2LjQKCWM1OS42LDAsMTExLjItNDguNCwxMzcuMi0xMDcuMlYxNDEuNkMzNjUuMiw5OS42LDMxMy42LDc5LjYsMjU0LDc5LjZ6Ii8+CjxwYXRoIHN0eWxlPSJmaWxsOiMzMjRBNUU7IiBkPSJNNDYxLjYsMTc2LjhjLTEzLjItMTEuNi0zNS4yLTkuNi01NS42LDMuMmMtMTMuNi02OC03Ni40LTEwMC44LTE1Mi0xMDAuOFMxMTUuNiwxMTIsMTAyLDE4MAoJYy0yMC40LTEyLjgtNDItMTQuOC01NS42LTMuMmMtMTEuNiwxMC0xNCwyNy42LTcuNiw0Ni40YzAuOC04LjgsNC0xNi44LDEwLjQtMjJjMTItMTAuNCwzMS42LTkuMiw1MC40LDEuNmMwLDIsMCw0LDAsNgoJYzAsNTIsMjQuNCwxMDguNCw2Mi40LDE0NS42Yy0zLjYtNi44LTcuMi0xNC0xMC40LTIyYy0yOS4yLTcwLjgtMjYtMTU1LjYsMTYuNC0xNzIuNGMyOC40LTExLjIsNjIsMTUuNiw4Niw2MC40CgljMjMuNi00NC44LDU3LjYtNzIsODYuNC02MC40YzQyLjQsMTYuOCw0NS42LDEwMS42LDE2LjQsMTcyLjRjLTMuMiw4LTYuOCwxNS4yLTEwLjQsMjJjMzgtMzcuMiw2Mi44LTkzLjYsNjIuOC0xNDUuNmMwLTIsMC00LDAtNgoJYzE4LjQtMTAuOCwzOC40LTEyLjQsNTAuNC0xLjZjNi40LDUuNiw5LjYsMTMuMiwxMC40LDIyQzQ3NS42LDIwNC40LDQ3My4yLDE4Ni44LDQ2MS42LDE3Ni44eiIvPgo8ZWxsaXBzZSBzdHlsZT0iZmlsbDojRkZGRkZGOyIgY3g9IjI1NCIgY3k9IjM1My42IiByeD0iMTAzLjYiIHJ5PSI3NC44Ii8+CjxjaXJjbGUgc3R5bGU9ImZpbGw6IzMyNEE1RTsiIGN4PSIzMDYuOCIgY3k9IjIzNy42IiByPSIxOC40Ii8+CjxlbGxpcHNlIHRyYW5zZm9ybT0ibWF0cml4KDAuNjE5MyAtMC43ODUxIDAuNzg1MSAwLjYxOTMgLTY4Ljc5NDIgMzIxLjg4MDQpIiBzdHlsZT0iZmlsbDojRkZGRkZGOyIgY3g9IjI5Ny41NCIgY3k9IjIzMS44ODQiIHJ4PSI1LjIiIHJ5PSIyLjQiLz4KPGNpcmNsZSBzdHlsZT0iZmlsbDojMzI0QTVFOyIgY3g9IjE5Ni40IiBjeT0iMjM3LjYiIHI9IjE4LjQiLz4KPGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoMC42MTkzIC0wLjc4NTEgMC43ODUxIDAuNjE5MyAtMTEwLjc3MyAyMzUuMjIyMikiIHN0eWxlPSJmaWxsOiNGRkZGRkY7IiBjeD0iMTg3LjE4NSIgY3k9IjIzMS44NDUiIHJ4PSI1LjIiIHJ5PSIyLjQiLz4KPGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojRTZFOUVFOyIgZD0iTTE1NCwzNzIuOGMyNC44LDExLjYsNjAsMTkuMiwxMDAsMTkuMnM3NS4yLTcuMiwxMDAtMTkuMmMyLTUuMiwzLjItMTAuOCwzLjItMTYuNAoJCWMtMjAuNCwxMi01NC40LDIxLjYtOTYuOCwyMi40VjM0MGgtMTIuOHYzOC44Yy00Mi40LTAuOC03Ni40LTEwLjQtOTYuOC0yMi40QzE1MC44LDM2MiwxNTIsMzY3LjYsMTU0LDM3Mi44eiIvPgoJPHBhdGggc3R5bGU9ImZpbGw6I0U2RTlFRTsiIGQ9Ik0yODgsMzI3LjZjMCw4LjgtMTUuMiwzMi0zNCwzMnMtMzQtMjMuMi0zNC0zMnMxNS4yLTE2LDM0LTE2UzI4OCwzMTguOCwyODgsMzI3LjZ6Ii8+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+"
```

## Links

- OpenSea documentation [https://docs.opensea.io/docs/metadata-standards](https://docs.opensea.io/docs/metadata-standards)