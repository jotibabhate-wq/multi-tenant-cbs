"""Tenant request validation starter; provisioning is not implemented yet."""
import json
import re

TENANT_CODE = re.compile(r"^[a-z0-9-]{3,30}$")


def _response(status_code, payload):
    return {
        "statusCode": status_code,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(payload),
    }


def lambda_handler(event, context):
    body = event.get("body", event)
    if isinstance(body, str):
        try:
            body = json.loads(body)
        except json.JSONDecodeError:
            return _response(400, {"error": "Invalid JSON body"})

    if not isinstance(body, dict):
        return _response(400, {"error": "Request must be a JSON object"})

    code = body.get("code")
    name = body.get("name")
    if not isinstance(code, str) or not TENANT_CODE.fullmatch(code):
        return _response(400, {"error": "Invalid tenant code"})
    if not isinstance(name, str) or not name.strip():
        return _response(400, {"error": "Tenant name is required"})

    return _response(202, {
        "message": "Request validated; actual provisioning is not implemented",
        "tenant_code": code,
        "tenant_name": name.strip(),
        "status": "pending",
    })
