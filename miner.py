import os
import subprocess

from homeassistant.config_entries import ConfigEntry
from homeassistant.core import HomeAssistant
from homeassistant.helpers.aiohttp_client import async_get_clientsession
from homeassistant.helpers.service import async_extract_config_entry_from_service_data

from .const import DOMAIN

async def async_setup(hass: HomeAssistant, config: dict):
    """Set up the Verus Coin Miner addon."""

    def async_mine(hass: HomeAssistant, config_entry: ConfigEntry, service_data: dict):
        """Start mining Verus Coin."""

        session = async_get_clientsession(hass)
        config_entry_data = async_extract_config_entry_from_service_data(config_entry, service_data)

        wallet_address = config_entry_data.get("wallet_address")
        mining_pool = config_entry_data.get("mining_pool")

        if not wallet_address or not mining_pool:
            return

        command = [
            "ccminer-verus",
            "-a",
            "verus",
            "-o",
            mining_pool,
            "-u",
            f"{wallet_address}.{os.getenv('VERUS_USERNAME')}",
            "-p",
            os.getenv("VERUS_PASSWORD"),
        ]

        process = await hass.async_create_subprocess_exec(*command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = await process.communicate()

        if stdout:
            hass.components.persistent_notification.create(stdout.decode("utf-8"))

        if stderr:
            hass.components.persistent_notification.create(stderr.decode("utf-8"), title="Error")

    hass.services.async_register(DOMAIN, "mine", async_mine)

    return True

async def async_unload(hass: HomeAssistant, config: dict):
    """Unload the Verus Coin Miner addon."""

    return True

