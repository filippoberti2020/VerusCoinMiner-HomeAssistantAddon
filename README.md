# VerusCoinMiner
A Home Assistant addon to mine Verus coin using ccminer-verus.

## Requirements
- Home Assistant 2022.12 or later
- A Verus wallet address
- A Verus mining pool

## Installation

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Ffilippoberti2020%2FVerusCoinMiner-HomeAssistantAddon)


1. Add the following repository to your Home Assistant:
    ```yaml
    repository: https://github.com/yourusername/veruscoinminer
    ```

2. Install the `veruscoinminer` addon from the Home Assistant integrations page.
3. Configure the addon with your Verus wallet address and the number of CPU threads to use for mining.

## Configuration
The `veruscoinminer` addon requires the following configuration options:
- `wallet_address`: Your Verus wallet address to receive the mined coins.
- `cpu_count`: The number of CPU threads to use for mining.

## Service
The `veruscoinminer` addon provides the following service:
- `mine`: Starts the Verus coin mining process.

## Usage
To start mining Verus coin, call the `mine` service with your wallet address and the number of CPU threads to use for mining:
```yaml
service: veruscoinminer.mine
data:
  wallet_address: YOUR_WALLET_ADDRESS
  cpu_count: NUM_CPU_THREADS
```
Note: The `veruscoinminer` addon is designed for personal use and should not be used for commercial mining operations.

## License
This addon is licensed under the MIT License.

## Support
If you encounter any issues or have any questions, please open an issue on this repository.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Credits
This addon is based on the ccminer-verus software from Oink70.
