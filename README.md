# dw ansible playbooks

## Подготовка к использованию

Рекомендуется использовать venv для ansible и версию, установленную с pip.
Поэтому, не должно быть локально установленного ansible.
Перед использованием не забудьте установить зависимости.

```
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

TODO: Импорт в плейбуки файла с переменными (keys/vars.yml)